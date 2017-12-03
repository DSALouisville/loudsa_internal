# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :loudsa_internal,
  ecto_repos: [LoudsaInternal.Repo]

# Configures the endpoint
config :loudsa_internal, LoudsaInternal.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Nyc4UmkBXxN0WreqC/wPzBcmILUmuzYQmh6DyixD1qBLC0YKV5q94Rj7spSYFqju",
  render_errors: [view: LoudsaInternal.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LoudsaInternal.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
