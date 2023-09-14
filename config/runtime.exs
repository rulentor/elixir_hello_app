import Config

url_host = "0.0.0.0"
#System.fetch_env!("URL_HOST")

config :hello, HelloWeb.Endpoint,
  url: [
    scheme: System.get_env("URL_SCHEME", "https"),
    host: url_host,
    port: System.get_env("URL_PORT", "443")
  ],
  static_url: [
    host: System.get_env("URL_STATIC_HOST", url_host)
  ],
  http: [port: System.get_env("PORT", "4000")],
  secret_key_base: "glNlGn3yCIDN8BWF3vHknW6J8oSnkXXasaFVnKg8OVa6pOjJCIKJ3q4SZKam7fPm",
#System.fetch_env!("SECRET_KEY_BASE"),
  # It is completely safe to hard code and use this salt value.
  live_view: [signing_salt: "k4yfnQW4r"]

db_user = System.get_env("POSTGRES_USER", "hello")
database = System.get_env("POSTGRES_DB", "hello")

database =
  if config_env() == :test do
    "#{database}_test#{System.get_env("MIX_TEST_PARTITION")}"
  else
    database
  end

config :hello, Hello.Repo,
  url: System.get_env("DATABASE_URL", "ecto://hello:password@postgres:5432/hello"),
  username: db_user,
  password: System.get_env("POSTGRES_PASSWORD", "password"),
  database: database,
  hostname: System.get_env("POSTGRES_HOST", "postgres"),
  port: String.to_integer(System.get_env("POSTGRES_PORT", "5432")),
  pool_size: String.to_integer(System.get_env("POSTGRES_POOL", "15"))
