defmodule Books.Repo.Migrations.CreateAutores do
  use Ecto.Migration

  def change do
    create table(:autor) do
      add :nombre, :string
    end

    create table(:book) do
      add :name, :string
      #add :autor, :string
      add :autor_id, references(:autor), null: false
    end

    #Tabla clientes
    create table(:cliente) do
      add :nombre, :string
      add :email, :string
    end

    #Tabla relacional
    create table(:libro_cliente) do
      add :book_id, references(:book)
      add :cliente_id, references(:cliente)
    end
    create unique_index(:libro_cliente, [:book_id, :cliente_id])
  end
end
