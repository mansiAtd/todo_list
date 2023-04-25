defmodule TodoList.Schema.TodoGroup do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @key {:uid, :binary_id, autogenerate: true}
  schema "todo_groups" do
    field(:name, :string)
    timestamps()
  end

  def changeset(%TodoList.Schema.TodoGroup{} = group, attrs) do
    group
    |> cast(attrs, [
      :name
    ])
  end
end
