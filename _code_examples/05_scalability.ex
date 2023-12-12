defmodule Work do
  def do_some_work() do
    1..100
    |> Enum.to_list()
    |> Enum.random()
  end
end

tasks = for _ <- 1..10_000, do: Task.async(fn -> Work.do_some_work() end)
results = tasks |> Enum.map(&Task.await(&1))
IO.inspect(results)
IO.inspect(length(results))
