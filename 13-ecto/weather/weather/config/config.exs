import Config

config :weather, Weather.Repo,
  database: "weather_repo",
  username: "postgres",
  password: "admin",
  hostname: "localhost"

  config :weather, ecto_repos: [Weather.Repo]
