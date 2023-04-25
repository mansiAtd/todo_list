defmodule TodoList.Todos do
  import Ecto.Query, warn: false
  alias Api.Repo
  alias TodoList.Schema.{Todo, TodoGroup, DependentTodo}

  def get_groups() do
    from(t in TodoGroup,
      select: t,
      preload: [:todos]
    )
    |> Repo.all()
  end

  def get_todos(group_uid) do
    from(t in Todo,
      join: tg in TodoGroup,
      on: tg.id == t.todo_group_id,
      where: tg.uid == ^group_uid,
      select: t,
      preload: [:dependent_todos]
    )
    |> Repo.all()
  end

  def update_todo(dependent_todo_uuid, attrs) do
    {:ok, todo} =
      dependent_todo_uuid
      |> get_dependent_todo()
      |> DependentTodo.changeset(attrs)
      |> Repo.update()
  end
end
