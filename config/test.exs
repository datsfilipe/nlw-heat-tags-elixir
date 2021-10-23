import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :nlw_tags, NlwTags.Repo,
  username: "postgres",
  password: "blablabla",
  database: "nlw_tags_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :nlw_tags, NlwTagsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "L9n+hNXbqt23lHEJ6ywOUWCZ2j41zbevyZ6ZCdLYe6zyoYXW2HlaJ2+0+S6K+sCZ",
  server: false

# In test we don't send emails.
config :nlw_tags, NlwTags.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
