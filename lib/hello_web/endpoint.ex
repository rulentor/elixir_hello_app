defmodule HelloWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :hello

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_hello_key",
    signing_salt: "G2y3uPtM",
    same_site: "Lax"
  ]

  plug Corsica,
    max_age: 600,
    origins: "*",
    allow_headers: ["accept", "content-type", "authorization"],
    allow_methods: ["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    allow_credentials: false,
    log: [rejected: :error, invalid: :warn, accepted: :debug]

  # socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]
  # Serve at "/"  "priv/static" directory.
  #

  plug Plug.Static,
    at: "/",
    from: :hello,
    gzip: false,
    only: HelloWeb.static_paths()

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :hello
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug HelloWeb.Router
end
