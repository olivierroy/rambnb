defmodule Rambnb.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :public_id}
  schema "bookings" do
    field :end_date, :date
    field :guest_email, :string
    field :guest_name, :string
    field :start_date, :date
    field :status, :string
    field :total_price, :decimal
    field :usage_type, :string
    field :public_id, Ecto.UUID

    belongs_to :listing, Rambnb.Catalog.Listing

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:start_date, :end_date, :usage_type, :guest_name, :guest_email, :total_price, :status, :listing_id])
    |> put_public_id()
    |> validate_required([
      :start_date,
      :end_date,
      :usage_type,
      :guest_name,
      :guest_email,
      :total_price,
      :status,
      :listing_id,
      :public_id
    ])
    |> assoc_constraint(:listing)
    |> unique_constraint(:public_id)
  end

  defp put_public_id(changeset) do
    case get_field(changeset, :public_id) do
      nil -> put_change(changeset, :public_id, Ecto.UUID.generate())
      _ -> changeset
    end
  end
end
