defmodule Redsocial.Repo.Migrations.CrearTablas do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nombre, :string
      add :mail, :string
    end

    create table(:posts) do
      add :texto, :string
      #add :autor, :string
      add :autor_id, references(:users), null: false
    end

    #Tabla relacional
    create table(:user_user) do
      add :user_id, references(:users), null: false
      add :user2, :integer
    end
    #create unique_index(:user_user, [:user_id, :user2])

  end
end
