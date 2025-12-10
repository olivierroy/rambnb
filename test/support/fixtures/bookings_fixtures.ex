defmodule Rambnb.BookingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rambnb.Bookings` context.
  """

  @doc """
  Generate a booking.
  """
  def booking_fixture(attrs \\ %{}) do
    {:ok, booking} =
      attrs
      |> Enum.into(%{
        end_date: ~D[2025-12-09],
        guest_email: "some guest_email",
        guest_name: "some guest_name",
        start_date: ~D[2025-12-09],
        status: "some status",
        total_price: "120.5",
        usage_type: "some usage_type"
      })
      |> Rambnb.Bookings.create_booking()

    booking
  end
end
