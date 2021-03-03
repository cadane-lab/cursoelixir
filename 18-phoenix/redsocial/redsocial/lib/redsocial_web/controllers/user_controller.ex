defmodule RedsocialWeb.UserController do
  use RedsocialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(%Plug.Conn{query_params: query_params} = conn, %{"accion" => messenger}) do

    respuesta = case messenger do
      "crear" ->
        nombre = query_params["nombre"]
        mail = query_params["mail"]
        Redsocial.crearUsuario(nombre, mail)
        %{Op: "CrearUser", user: nombre, mail: mail}
      "leer" ->
        userId = query_params["user"]
        user = Redsocial.leerUsuario(userId)
        lista = Enum.map(user, fn user -> %{user.nombre} end)
        #%{id: user.id, nombre: user.nombre, mail: user.mail}
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
