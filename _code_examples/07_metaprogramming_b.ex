quote do
  10 + 20
end
|> IO.inspect()

defmodule MyMacro do
  defmacro ten_plus_twenty do
    {:*, [context: Elixir, imports: [{1, Kernel}, {2, Kernel}]], [10, 20]}
  end
end

defmodule Greetings do
  import MyMacro

  def call_macro do
    ten_plus_twenty()
  end
end

Greetings.call_macro() |> IO.inspect()
