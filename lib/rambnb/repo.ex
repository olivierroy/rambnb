defmodule Rambnb.Repo do
  use Ecto.Repo,
    otp_app: :rambnb,
    adapter: Ecto.Adapters.Postgres
end
