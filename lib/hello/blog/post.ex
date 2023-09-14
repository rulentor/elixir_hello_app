defmodule Hello.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "blog_posts" do
    field :tags, {:array, :string}
    field :title, :string
    field :views, :integer
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :views, :tags])
    |> validate_required([:title, :views, :tags])
  end
end
