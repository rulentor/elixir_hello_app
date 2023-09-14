defmodule Hello.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :login, :string
    field :password, :string
    field :email, :string
    field :phone, :string
    field :role, :string
    field :first_name, :string
    field :last_name, :string
    field :patronymic, :string
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:login, :password, :email, :phone, :role, :first_name, :last_name, :patronymic])
    |> validate_required([])
    |> unique_constraint(:email)
  end
end
