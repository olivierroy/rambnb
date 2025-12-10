defmodule Rambnb.Catalog.Listing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "listings" do
    field :available, :boolean, default: false
    field :brand, :string
    field :capacity, :integer
    field :description, :string
    field :image_url, :string
    field :location, :string
    field :memory_type, :string
    field :price_per_day, :decimal
    field :speed, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(listing, attrs) do
    listing
    |> cast(attrs, [:title, :memory_type, :capacity, :speed, :brand, :price_per_day, :location, :description, :image_url, :available])
    |> validate_required([:title, :memory_type, :capacity, :speed, :brand, :price_per_day, :location, :description, :image_url, :available])
  end
end
