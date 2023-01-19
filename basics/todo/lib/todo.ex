defmodule Todo do
  @type t() :: %__MODULE__ {
    id: integer,
    title: String.t,
    description: String.t
  }

  @enforce_keys [:id, :title, :description]
  defstruct [:id, :title, :description]
end
