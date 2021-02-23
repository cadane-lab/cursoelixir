defmodule Estudiante do
  defstruct [:name, :email, :edad, :telefono]

  defimpl Mongo.Encoder  do
    def encode(%{name: name, email: email, edad: edad, telefono: telefono}) do
      %{name: name, email: email, edad: edad, telefono: telefono}
    end
  end
end

# {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/config", username: "root", password: "example", auth_source: "admin")
# estu1 = %Estudiante{name: "Camel", email: "", edad: 30, telefono: "300" }
# Mongo.insert_one!(conn, "estudiantes", estu1)
