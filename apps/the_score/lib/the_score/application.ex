defmodule TheScore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TheScore.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TheScore.PubSub}
      # Start a worker by calling: TheScore.Worker.start_link(arg)
      # {TheScore.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: TheScore.Supervisor)
  end
end
