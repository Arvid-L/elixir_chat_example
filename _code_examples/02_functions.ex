# Functions

defmodule FunctionExample do
  def sum_def(a, b) do
    a + b
  end
end

sum_anonymous = fn a, b -> a + b end
sum_anonymous_short = &(&1 + &2)

FunctionExample.sum_def(1, 2) |> IO.inspect()
sum_anonymous.(2, 3) |> IO.inspect()
sum_anonymous_short.(3, 4) |> IO.inspect()
