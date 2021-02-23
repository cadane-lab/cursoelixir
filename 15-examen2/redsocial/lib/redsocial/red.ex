defmodule Red.Usuarios do
  use Ecto.Schema
  schema "users" do
    field :nombre, :string
    field :mail, :string
    has_many :autor, Red.Post
    has_many :user_id, Red.Amistad
    #many_to_many :amigos, Red.Amistad, join_through: "user_user"
  end
  def changeset(book, params \\ %{} ) do
    book
    |> Ecto.Changeset.cast(params, [:nombre])
    |> Ecto.Changeset.validate_required([:nombre])
  end
end

defmodule Red.Post do
  use Ecto.Schema
  schema "posts" do
    field :texto, :string
    belongs_to :autor, Red.Usuarios
    #belongs_to :post, Post
  end
  def changeset(autores, params \\ %{} ) do
    autores
  |> Ecto.Changeset.cast(params, [:texto])
  |> Ecto.Changeset.validate_required([:texto])
  end
end


defmodule Red.Amistad do
  use Ecto.Schema
  schema "user_user" do
    belongs_to :user, Red.Usuarios
    field :user2, :integer
    #belongs_to :post, Post
  end

  def changeset(user_id, params \\ %{} ) do
    user_id
  |> Ecto.Changeset.cast(params, [:user])
  |> Ecto.Changeset.validate_required([:user])
  end
end
