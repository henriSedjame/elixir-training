defmodule TodoList do

  @type t() :: %__MODULE__ {
    next_id: integer,
    todos: [Todo.t]
  }

  defstruct [
    next_id: 0,
    todos: []
  ]
  
end
