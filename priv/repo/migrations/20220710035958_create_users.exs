defmodule Shortner.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :slug, :string
      add :visits_counter, :integer

      timestamps()
    end
  end
end
