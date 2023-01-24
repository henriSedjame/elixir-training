defmodule Multiplication do

  @type t :: %__MODULE__{
    number: integer,
    multiplicator: integer
  }

  @enforce_keys [:number, :multiplicator]
  defstruct [:number, :multiplicator ]

  defimpl Operation, for: Multiplication do
    def execute(%Multiplication{number: n1, multiplicator: n2}) do
      n1 * n2
    end
  end
  
end
