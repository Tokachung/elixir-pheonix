defmodule Forum.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  # Note that once the migration for add user_id to posts is run,
  # the schema for the post msut be updated to include the user_id field.
  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, Forum.Accounts.User # This line is added to associate a post with a user.
    timestamps(type: :utc_datetime)
  end

  # Note that the validation for the post schema must be updated to include the user_id field.
  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :title, :user_id])
    |> validate_required([:body, :title, :user_id])
  end
end
