import Config

config :books, Books.Repo,
  database: "books_repo",
  username: "postgres",
  password: "admin",
  hostname: "localhost"

 config :books, ecto_repos: [Books.Repo]
