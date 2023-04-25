defmodule TodoListWeb.TodoController do
  use TodoListWeb, :controller
  alias TodoList.Todos
  import Ecto.Changeset

  plug(
    ApiWeb.Authorize,
    [roles: [:superadmin, :ops], abilities: [:account_admin, :brand_admin]]
    when action in [:create, :update, :delete]
  )

  action_fallback(ApiWeb.FallbackController)

  def get_todo_groups(conn, _) do
    todo_groups = Todos.get_groups()

    render(conn, "groups.json", todos_groups)
  end

  def get_todos(conn, %{"todo_group_uid" => todo_group_uid}) do
    todos = Todos.get_todos_for_group(todo_group_uid)

    render(conn, "todos.json", todos)
  end

  def update(conn, %{"dependent_todo_uid" => dependent_todo_uid, "params" => params}) do
    todo = Todos.update_todo(dependent_todo_uid, params)
    render(conn, "todo.json", todo)
  end
end
