defmodule TodoList.Schema.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @key {:uid, :binary_id, autogenerate: true}
  schema "todos" do
    field(:name, :string)
    belongs_to(:todo_group, TodoList.Schema.TodoGroup, foreign_key: :todo_group_id)
    field(:is_locked, :boolean)
    timestamps()
  end

  def changeset(%TodoList.Schema.Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [
      :name,
      :is_locked,
      :todo_group_id
    ])
  end
end
