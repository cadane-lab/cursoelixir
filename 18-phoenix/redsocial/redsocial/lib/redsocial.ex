defmodule Redsocial do
  @moduledoc """
  Redsocial keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  import Ecto.Query
  @moduledoc """
  Documentation for `Redsocial`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Redsocial.hello()
      :world

  """
  def hello do
    :world
  end

  #1. Crear usuarios
  def crearUsuario(nombre, mail) do
    usuario = %Red.Usuarios{nombre: "#{nombre}", mail: "#{mail}"}
    insertarData(usuario)
  end

  #2. Agregar como amigos
  def amistad(user1, user2) do
    amistad = %Red.Amistad{user_id: user1, user2: user2}
    insertarData(amistad)

    amistad = %Red.Amistad{user_id: user2, user2: user1}
    insertarData(amistad)

    #####################################
    #sql = "insert into user_user (user1, user2) values (#{user1}, #{user2});"
    #nativoSQL(sql)
  end

  #3. Publicar post
  def crearPost(texto, autor) do
    publicacion = %Red.Post{texto: "#{texto}", autor_id: autor}
    insertarData(publicacion)
  end

  #4. Leer post de los amigos
  def leerPost(usuario, pagina \\ 1, limite \\ 10) do
    #ejemplo
    #Repo.all from p in Post,
    #      join: c in assoc(p, :comments),
    #      where: c.votes > p.votes,
    #      preload: [comments: c]

    paginaS = case pagina do
      0 -> 1
      1 -> 0
      _ -> (pagina-1) * limite
    end
    ####
    query =
      from uu in Red.Amistad,
      join: p in Red.Post, on: uu.user2 == p.autor_id,
      join: u2 in Red.Usuarios, on: p.autor_id == u2.id,
      where: uu.user_id == ^usuario,
      order_by: [desc: p.id],
      limit: ^limite,
      offset: ^paginaS,
      #preload: [users: :users],
      select: {p, u2}

    result = Redsocial.Repo.all(query)
    Enum.map(result, fn({p, u})->
      Map.put(p, :autor, u)
    end)
    #######################################
    #sql = "select p.texto, u2.nombre from user_user uu
    #left join posts p on uu.user2 = p.autor_id
    #left join users u2 on p.autor_id = u2.id
    #where uu.user_id = #{usuario} limit #{limite} offset #{paginaS}"
    #nativoSQL(sql)
  end

  def leerUsuario(usuario) do
    query =
      from u in Red.Usuarios,
      where: u.id == ^usuario,
      select: u

    result = Redsocial.Repo.all(query)
  end

  def listarAmigos(usuario) do
    #select * from user_user uu
    #left join users u2 on uu.user2 = u2.id
    #where uu.user_id = '1'
    query =
      from uu in Red.Amistad,
      join: u2 in Red.Usuarios, on: uu.user2 == u2.id,
      where: uu.user_id == ^usuario,
      select: u2

    result = Redsocial.Repo.all(query)
  end

  defp insertarData(datos) do
    Redsocial.Repo.insert(datos)
  end

  defp nativoSQL(query) do
    Ecto.Adapters.SQL.query!(Redsocial.Repo, query)
  end

end
#
#mix ecto.create
#mix ecto.migrate
#
##1. Crear usuarios
#Redsocial.crearUsuario(nombre, mail)
#
##2. Agregar como amigos
#Redsocial.amistad(1, 2)
#
##3. Publicar post
#Redsocial.crearPost(texto, autor)
#
##4. Leer post de los amigos
#Redsocial.leerPost(usuario, pagina \\ 1, nR \\ 10)
#registros.rows
#
#
#Redsocial.crearUsuario("Camel David", "cadane")
#Redsocial.crearUsuario("david ayala", "david@")
#Redsocial.crearUsuario("Sofia Maria", "sofia@")
#Redsocial.crearUsuario("Juan Carlos", "juancarlos")
#
#Redsocial.crearPost("Post 1 del autor 1", 1)
#Redsocial.crearPost("Post 2 del autor 1", 1)
#Redsocial.crearPost("Post 3 del autor 1", 1)
#
#Redsocial.crearPost("Post 1 del autor 2", 2)
#Redsocial.crearPost("Post 2 del autor 2", 2)
#Redsocial.crearPost("Post 3 del autor 2", 2)
#
#Redsocial.crearPost("Post 1 del autor 3", 3)
#Redsocial.crearPost("Post 2 del autor 3", 3)
#Redsocial.crearPost("Post 3 del autor 3", 3)
#
#Redsocial.crearPost("Post 1 del autor 4", 4)
#Redsocial.crearPost("Post 2 del autor 4", 4)
#Redsocial.crearPost("Post 3 del autor 4", 4)
#
###################
#Redsocial.amistad(1, 2)
#Redsocial.leerPost(1, 1, 2)
#
#leerPost(usuario, pagina \\ 1, limite \\ 10)
#
#
#########
#select p.texto, u2.nombre from user_user uu
#left join posts p on uu.user2 = p.autor_id
#left join users u2 on p.autor_id = u2.id
#where uu.user_id = 1 limit 10 offset 0
