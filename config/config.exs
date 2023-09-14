import Config

config :hello,
  ecto_repos: [Hello.Repo],
  generators: [binary_id: true]

config :hello, HelloWeb.Endpoint,
  # Enable both ipv4 and ipv6 on all interfaces. By the way, the port is
  http: [ip: {0, 0, 0, 0, 0, 0, 0, 0}],
  render_errors: [
    formats: [json: HelloWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Hello.PubSub,
  live_view: [signing_salt: "f7WWd93I"]

config :hello, Hello.Repo, adapter: Ecto.Adapters.Postgres

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :hello, Hello.Mailer, adapter: Swoosh.Adapters.Local

config :swoosh, :api_client, false
#import_config "#{config_env()}.exs"
import_config "#{Mix.env()}.exs"
