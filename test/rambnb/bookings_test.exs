defmodule Rambnb.BookingsTest do
  use Rambnb.DataCase

  alias Rambnb.Bookings

  describe "bookings" do
    alias Rambnb.Bookings.Booking

    import Rambnb.BookingsFixtures

    @invalid_attrs %{end_date: nil, guest_email: nil, guest_name: nil, start_date: nil, status: nil, total_price: nil, usage_type: nil}

    test "list_bookings/0 returns all bookings" do
      booking = booking_fixture()
      assert Bookings.list_bookings() == [booking]
    end

    test "get_booking!/1 returns the booking with given id" do
      booking = booking_fixture()
      assert Bookings.get_booking!(booking.id) == booking
    end

    test "create_booking/1 with valid data creates a booking" do
      valid_attrs = %{end_date: ~D[2025-12-09], guest_email: "some guest_email", guest_name: "some guest_name", start_date: ~D[2025-12-09], status: "some status", total_price: "120.5", usage_type: "some usage_type"}

      assert {:ok, %Booking{} = booking} = Bookings.create_booking(valid_attrs)
      assert booking.end_date == ~D[2025-12-09]
      assert booking.guest_email == "some guest_email"
      assert booking.guest_name == "some guest_name"
      assert booking.start_date == ~D[2025-12-09]
      assert booking.status == "some status"
      assert booking.total_price == Decimal.new("120.5")
      assert booking.usage_type == "some usage_type"
    end

    test "create_booking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_booking(@invalid_attrs)
    end

    test "update_booking/2 with valid data updates the booking" do
      booking = booking_fixture()
      update_attrs = %{end_date: ~D[2025-12-10], guest_email: "some updated guest_email", guest_name: "some updated guest_name", start_date: ~D[2025-12-10], status: "some updated status", total_price: "456.7", usage_type: "some updated usage_type"}

      assert {:ok, %Booking{} = booking} = Bookings.update_booking(booking, update_attrs)
      assert booking.end_date == ~D[2025-12-10]
      assert booking.guest_email == "some updated guest_email"
      assert booking.guest_name == "some updated guest_name"
      assert booking.start_date == ~D[2025-12-10]
      assert booking.status == "some updated status"
      assert booking.total_price == Decimal.new("456.7")
      assert booking.usage_type == "some updated usage_type"
    end

    test "update_booking/2 with invalid data returns error changeset" do
      booking = booking_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_booking(booking, @invalid_attrs)
      assert booking == Bookings.get_booking!(booking.id)
    end

    test "delete_booking/1 deletes the booking" do
      booking = booking_fixture()
      assert {:ok, %Booking{}} = Bookings.delete_booking(booking)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_booking!(booking.id) end
    end

    test "change_booking/1 returns a booking changeset" do
      booking = booking_fixture()
      assert %Ecto.Changeset{} = Bookings.change_booking(booking)
    end
  end
end
