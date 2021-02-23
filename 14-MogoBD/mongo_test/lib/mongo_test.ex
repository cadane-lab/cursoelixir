defmodule MongoTest do
  @moduledoc """
  Documentation for `MongoTest`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MongoTest.hello()
      :world

  """
  def hello do
    :world
  end

# {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/config", username: "root", password: "example", auth_source: "admin")
# cursor = Mongo.find(conn, "estudiantes", %{})
# cursor |> Enum.to_list() |> IO.inspect
########
#Insertar
# cursor = Mongo.insert_one!(conn, "estudiantes", %{"name" => "Nidia Stela", "telefono" => "3425", "edad" => 30})

  #def insertar(datos) do
  #  {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/config", username: "root", password: "example", auth_source: "admin")
  #  cursor = Mongo.insert_one!(conn, "estudiantes", datos)
  #  #{:ok, "Hola"}
  #end
end
