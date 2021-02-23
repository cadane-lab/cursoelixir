import Config

config :redsocial, Redsocial.Repo,
  database: "redsocial_repo",
  username: "postgres",
  password: "admin",
  hostname: "localhost"

  config :redsocial, ecto_repos: [Redsocial.Repo]
