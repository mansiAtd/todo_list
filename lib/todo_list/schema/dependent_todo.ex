defmodule TodoList.Schema.DependentTodo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @key {:uid, :binary_id, autogenerate: true}
  schema "dependent_todos" do
    field(:name, :string)
    belongs_to(:todo, TodoList.Schema.Todo, foreign_key: :todo_id)
    field(:is_complete, :boolean)
    timestamps()
  end

  def changeset(%TodoList.Schema.DependentTodo{} = todo, attrs) do
    todo
    |> cast(attrs, [
      :name,
      :is_complete,
      :todo_id
    ])
  end
end
