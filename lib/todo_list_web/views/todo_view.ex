defmodule TodoListWeb.TodoView do
  use TodoListWeb, :view

  def render("groups.json", %{todo_groups: todo_groups}) do
    todo_groups
    |> Enum.map(fn group ->
      %{
        name: group.name,
        uid: group.uid,
        number_of_todos: Enum.count(group.todos)
      }
    end)
  end

  def render("todos.json", %{todos: todos}) do
    todos
    |> Enum.map(fn todo ->
      %{
        name: todo.name,
        is_locked: todo.is_locked,
        uid: todo.uid,
        dependent_todos: list_sub_todos(todo.dependent_todos)
      }
    end)
  end

  def render("todo.json", %{todo: todo}) do
    %{
      name: todo.name,
      is_complete: todo.is_complete,
      uid: todo.uid
    }
  end

  def list_sub_todos(dependent_todos) do
    dependent_todos
    |> Enum.map(fn t ->
      %{
        name: t.name,
        is_complete: t.is_complete,
        uid: t.uid
      }
    end)
  end
end
