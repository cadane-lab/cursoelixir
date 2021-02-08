import User

user =
  create_user()
  |> set_name("Camel", "Negrete")
  |> set_country("Colombia")
  |> set_languages(["Español", "Nada mas"])

  inspect(user) |> IO.puts()
