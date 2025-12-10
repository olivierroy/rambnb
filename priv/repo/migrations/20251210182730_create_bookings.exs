defmodule Rambnb.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :start_date, :date
      add :end_date, :date
      add :usage_type, :string
      add :guest_name, :string
      add :guest_email, :string
      add :total_price, :decimal
      add :status, :string
      add :listing_id, references(:listings, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:bookings, [:listing_id])
  end
end
