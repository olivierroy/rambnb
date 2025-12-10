defmodule Rambnb.Repo.Migrations.CreateListings do
  use Ecto.Migration

  def change do
    create table(:listings) do
      add :title, :string
      add :memory_type, :string
      add :capacity, :integer
      add :speed, :string
      add :brand, :string
      add :price_per_day, :decimal
      add :location, :string
      add :description, :text
      add :image_url, :string
      add :available, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
