pid = spawn(fn -> 1 + 1 end)
self = self()

Process.alive?(self) |> IO.inspect()
Process.alive?(pid) |> IO.inspect()

defmodule ReceiveLoop do
  def loop() do
    receive do
      {:hello, message} -> IO.inspect(message)
      {:world, message} -> IO.inspect(message)
      {:error, error} -> raise error
      {_, message} -> IO.puts("Undefined message received: #{message}")
    after
      5_000 -> "no more messages reveiced for 1 second"
    end

    loop()
  end
end

send(self(), {:hello, "world"})
send(self(), {:world, "hello"})
send(self(), {:undefined_case, "another message"})
send(self(), {:error, RuntimeError})

ReceiveLoop.loop()
