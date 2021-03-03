defmodule RedsocialWeb.PostController do
  use RedsocialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(%Plug.Conn{query_params: query_params} = conn, %{"messenger" => messenger}) do
    respuesta = case messenger do
      "leer" ->
        usuario = query_params["user"]
        pagina = query_params["pg"]
        nrow = query_params["nrow"]
        pagina = String.to_integer(pagina)

        post = Redsocial.leerPost(usuario, pagina, nrow)
        lista = Enum.map(post, fn post -> %{texto: post.texto} end)
        #valor1 = Enum.at(lista, 1)
        #%{texto: valor1.texto, autor: valor1.autor.nombre}
    end
    #html(conn, respuesta)
    json(conn, respuesta)
  end

  def create(conn, _params) do
    usuario = conn.body_params["user"]
    texto = conn.body_params["text"]
    usuario = String.to_integer(usuario)
    Redsocial.crearPost(texto, usuario)
    json(conn, %{op: "crearPost", user: usuario, texto: texto})
  end


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
