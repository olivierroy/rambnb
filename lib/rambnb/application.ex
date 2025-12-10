defmodule Rambnb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RambnbWeb.Telemetry,
      Rambnb.Repo,
      {DNSCluster, query: Application.get_env(:rambnb, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Rambnb.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Rambnb.Finch},
      # Start a worker by calling: Rambnb.Worker.start_link(arg)
      # {Rambnb.Worker, arg},
      # Start to serve requests, typically the last entry
      RambnbWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rambnb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RambnbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
