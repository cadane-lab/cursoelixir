defmodule RedsocialWeb.UserController do
  use RedsocialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(%Plug.Conn{query_params: query_params} = conn, %{"accion" => accion}) do

    respuesta = case accion do
      "crear" ->
        nombre = query_params["nombre"]
        mail = query_params["mail"]
        Redsocial.crearUsuario(nombre, mail)
        %{Op: "CrearUser", user: nombre, mail: mail}
      "leer" ->
        userId = query_params["user"]
        user = Redsocial.leerUsuario(userId)
        lista = Enum.map(user, fn user -> %{id: user.id, nombre: user.nombre, mail: user.mail} end)
      "amistad" ->
        user1 = query_params["user1"]
        user2 = query_params["user2"]

        user1 = String.to_integer(user1)
        user2 = String.to_integer(user2)

        Redsocial.amistad(user1, user2)
        %{estado: "Ok"}
        "listar" ->
          user = query_params["user"]
          user = String.to_integer(user)
          amigos = Redsocial.listarAmigos(user)

          lista = Enum.map(amigos, fn amigos -> %{id: amigos.id, nombre: amigos.nombre, mail: amigos.mail} end)
        _ -> %{novalue: "no function"}
      end


    #html(conn, respuesta)
    json(conn, respuesta)
  end

  #def show(conn, %{"messenger" => messenger}) do
  #  render(conn, "show.html", messenger: messenger)
  #end

  #def show(%Plug.Conn{query_params: query_params} = conn, %{"messenger" => messenger}) do
    #case query_params["format"] do
    #  "json" -> json(conn, %{id: messenger})
    #  "text" -> text(conn, "From messenger #{messenger}")
    #  _ -> conn
    #    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    #    |> put_flash(:error, "Let's pretend we have an error.")
    #    |> render("show.html", messenger: messenger)
    #end

  #end


end
