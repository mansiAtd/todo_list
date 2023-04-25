defmodule TodoList.Repo.Migrations.AddTaskGroupsTable do
  use Ecto.Migration

  def change do
    create table(:todo_groups) do
      add :uid, :uuid
      add :name, :string
    end

    create table(:todos) do
      add :uid, :uuid
      add :name, :string
      add :todo_group_id, references(:todo_groups, on_delete: :delete_all)
      add :is_locked, :boolean
    end

    create table(:dependent_todos) do
      add(:uid, :uuid)
      add :name, :string
      add :todo_id, references(:todos, on_delete: :delete_all)
      add :is_complete, :boolean
    end
  end
end
