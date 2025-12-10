defmodule RambnbWeb.BookingController do
  use RambnbWeb, :controller

  alias Rambnb.Bookings
  alias Rambnb.Bookings.Booking
  alias Rambnb.Catalog

  def index(conn, _params) do
    bookings = Bookings.list_bookings()
    render(conn, :index, bookings: bookings)
  end

  def new(conn, _params) do
    changeset = Bookings.change_booking(%Booking{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"booking" => booking_params}) do
    listing = Catalog.get_listing!(booking_params["listing_id"])

    start_date = Date.from_iso8601!(booking_params["start_date"])
    end_date = Date.from_iso8601!(booking_params["end_date"])
    days = Date.diff(end_date, start_date)

    total_price = Decimal.mult(listing.price_per_day, Decimal.new(days))

    booking_params =
      booking_params
      |> Map.put("total_price", total_price)
      |> Map.put("status", "confirmed")

    case Bookings.create_booking(booking_params) do
      {:ok, booking} ->
        conn
        |> put_flash(:info, "RAM reserved successfully! Check your email for confirmation.")
        |> redirect(to: ~p"/bookings/#{booking}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    booking = Bookings.get_booking!(id)
    render(conn, :show, booking: booking)
  end

  def edit(conn, %{"id" => id}) do
    booking = Bookings.get_booking!(id)
    changeset = Bookings.change_booking(booking)
    render(conn, :edit, booking: booking, changeset: changeset)
  end

  def update(conn, %{"id" => id, "booking" => booking_params}) do
    booking = Bookings.get_booking!(id)

    case Bookings.update_booking(booking, booking_params) do
      {:ok, booking} ->
        conn
        |> put_flash(:info, "Booking updated successfully.")
        |> redirect(to: ~p"/bookings/#{booking}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, booking: booking, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    booking = Bookings.get_booking!(id)
    {:ok, _booking} = Bookings.delete_booking(booking)

    conn
    |> put_flash(:info, "Booking deleted successfully.")
    |> redirect(to: ~p"/bookings")
  end
end
