defmodule Calculator do

  def calculate(:add, a, b) do
    Operation.execute(%Addition{number1: a, number2: b})
  end

  def calculate(:sub, a, b) do
    Operation.execute(%Subtraction{number1: a, number2: b})
  end

  def calculate(:mult, a, b) do
    Operation.execute(%Multiplication{number: a, multiplicator: b})
  end

  def calculate(:div, a, b) do
    Operation.execute(%Division{number: a, divider: b})
  end


end
