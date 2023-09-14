defmodule Hello.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :login, :string
      add :password, :string
      add :email, :string
      add :phone, :string
      add :role, :string
      add :first_name, :string
      add :last_name, :string
      add :patronymic, :string
      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
