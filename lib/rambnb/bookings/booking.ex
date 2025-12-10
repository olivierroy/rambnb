defmodule Rambnb.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :end_date, :date
    field :guest_email, :string
    field :guest_name, :string
    field :start_date, :date
    field :status, :string
    field :total_price, :decimal
    field :usage_type, :string
    field :listing_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:start_date, :end_date, :usage_type, :guest_name, :guest_email, :total_price, :status])
    |> validate_required([:start_date, :end_date, :usage_type, :guest_name, :guest_email, :total_price, :status])
  end
end
