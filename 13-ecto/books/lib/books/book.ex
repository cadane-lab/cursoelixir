defmodule Books.Book do

  use Ecto.Schema
  schema "book" do
    field :name, :string
    belongs_to :autor, Books.Autor
    many_to_many :cliente, Books.Cliente, join_through: "libro_cliente"
  end
  def changeset(book, params \\ %{} ) do
    book
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end

end

defmodule Books.Autor do
  use Ecto.Schema
  schema "autor" do
    has_many :autor, Books.Book
    field :nombre, :string
    #belongs_to :post, Post
  end
  def changeset(autores, params \\ %{} ) do
    autores
  |> Ecto.Changeset.cast(params, [:nombre])
  |> Ecto.Changeset.validate_required([:nombre])
  end
end

defmodule Books.Cliente do
  use Ecto.Schema
  schema "cliente" do
    field :nombre, :string
    field :email, :string
    many_to_many :libro, Books.Book, join_through: "libro_cliente"
  end
  def changeset(autores, params \\ %{} ) do
    autores
  |> Ecto.Changeset.cast(params, [:nombre])
  |> Ecto.Changeset.validate_required([:nombre])
  end
end
#autor = %Books.Autor{nombre: "Autor numero uno"}
#Books.Repo.insert(autor)
#
#cliente = %Books.Cliente{nombre: "Cliente uno", email: "1@mail"}
#Books.Repo.insert(cliente)
#
#libro = %Books.Book{name: "El libro uno", autor_id: 1, cliente: 1}
