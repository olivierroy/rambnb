defmodule Rambnb.Repo.Migrations.AddPublicIdToBookings do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS pgcrypto", "")

    alter table(:bookings) do
      add :public_id, :uuid, null: false, default: fragment("gen_random_uuid()")
    end

    create unique_index(:bookings, [:public_id])
  end
end
