# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :the_score,
  ecto_repos: [TheScore.Repo]

config :the_score_web,
  ecto_repos: [TheScore.Repo],
  generators: [context_app: :the_score, binary_id: true]

# Configures the endpoint
config :the_score_web, TheScoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HZzDRSlRHJ+mHv62nPavmz2rMdqj2sOkSyU5cKMXgJMGBP79gtJy0rpRsB7LhILz",
  render_errors: [view: TheScoreWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TheScore.PubSub,
  live_view: [signing_salt: "7B4dvr0S"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
