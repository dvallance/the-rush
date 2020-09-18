defmodule TheScoreWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TheScoreWeb.Telemetry,
      # Start the Endpoint (http/https)
      TheScoreWeb.Endpoint
      # Start a worker by calling: TheScoreWeb.Worker.start_link(arg)
      # {TheScoreWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TheScoreWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TheScoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
