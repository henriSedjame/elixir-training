defmodule Subtraction do

  @type t :: %__MODULE__{
    number1: integer,
    number2: integer
  }

  @enforce_keys [:number1, :number2]
  defstruct [:number1, :number2 ]

  defimpl Operation, for: Subtraction do
    def execute(%Subtraction{number1: n1, number2: n2}) do
      n1 - n2
    end
  end
  
end
