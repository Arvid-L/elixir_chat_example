defmodule MyMacro do
  defmacro greet(name) do
    quote do
      IO.puts("Hello, <%= unquote(name) %>!")
    end
  end
end

defmodule Greetings do
  import MyMacro

  def greet_world do
    greet("World")
  end
end

# Calling the function that uses the macro
Greetings.greet_world()
