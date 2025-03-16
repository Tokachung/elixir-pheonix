defmodule Forum.Repo.Migrations.AddUserIdToPosts do
  # Purpose of this script is to add a user_id column to the posts table.
  # This is to associate a post with a user.

  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :user_id, references(:users, on_delete: :nothing)
    end
  end
end
