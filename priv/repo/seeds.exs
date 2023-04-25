alias TodoList.Repo

alias TodoList.Schema.{
  TodoGroup,
  Todo,
  DependentTodo
}

Repo.insert_all(TodoGroup, [
  %{
    name: "Todo Group 1"
  },
  %{
    name: "Todo Group 2"
  }
])

Repo.insert_all(Todo, [
  %{
    name: "Todo 1",
    is_locked: true,
    todo_group_id: 1
  },
  %{
    name: "Todo 2",
    is_locked: true,
    todo_group_id: 1
  },
  %{
    name: "Todo 3",
    is_locked: true,
    todo_group_id: 1
  },
  %{
    name: "Todo 4",
    is_locked: true,
    todo_group_id: 2
  },
  %{
    name: "Todo 5",
    is_locked: true,
    todo_group_id: 2
  }
])

Repo.insert_all(DependentTodo, [
  %{
    name: "Sub Todo 1",
    is_complete: true,
    todo_id: 1
  },
  %{
    name: "Sub Todo 2",
    is_complete: true,
    todo_id: 1
  },
  %{
    name: "Sub Todo 3",
    is_complete: false,
    todo_id: 1
  },
  %{
    name: "Sub Todo 4",
    is_complete: true,
    todo_id: 2
  },
  %{
    name: "Sub Todo 5",
    is_complete: false,
    todo_id: 2
  }
])
