defmodule Inmana.Repo.Migrations.CreateRestaurantsTable do
  use Ecto.Migration

  def change do
    # Criando tabela
    create table(:restaurants) do
      # Definindo campos
      add :email, :string
      add :name, :string

      timestamps()
    end

    # Não permitindo emails iguais
    create unique_index(:restaurants, [:email])
  end
end
