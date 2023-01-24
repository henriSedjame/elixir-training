defmodule Division do
  @type t :: %__MODULE__{
               number: integer,
               divider: integer
             }

  @enforce_keys [:number, :divider]
  defstruct [:number, :divider ]

  defimpl Operation, for: Division do

    def execute(%Division {number: _, divider: 0}), do: IO.puts "Divide by zero error"

    def execute(%Division{number: n1, divider: n2}) do
      n1 / n2
    end
  end


end
