defmodule TodoStorage do
  use Agent

  @agent_name __MODULE__

  @doc """
  Add todo request
  """
  @type add_todo_request() :: [title: String.t(), description: String.t()]

  @doc """
  Todo id parameter
  """
  @type id() :: integer


  @doc """
  Start the storage as Agent
  """
  def start_link() do
   Agent.start_link(
      fn -> %TodoList{} end,
      name: @agent_name)
  end

  @doc """
  Add a new todo
  """
  @spec add(add_todo_request()) :: :ok
  def add([title: title, description: description])  do
    Agent.cast(@agent_name,
      fn list ->
       %TodoList{
          next_id: list.next_id + 1,
          todos: list.todos ++ [%Todo{id: list.next_id, title: title, description: description}]
       }

    end)
  end

  @doc """
  Get todo by a given id
  """
  @spec get_by_id(id()) :: Todo.t()
  def get_by_id(id) do

    with get_fn <- fn list -> list.todos |> Enum.find(fn todo -> todo.id == id end) end,
         todo <- Agent.get(@agent_name, get_fn) do
      todo
    else
      nil -> raise TodoError.not_found(id)
    end

  end

  @doc """
  Get all todos
  """
  @spec get_all() :: [Todo.t()]
  def get_all() do
    Agent.get(@agent_name, &(&1.todos))
  end

end
