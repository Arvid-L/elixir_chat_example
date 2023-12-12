defmodule DocumentationExampleTest do
  use ExUnit.Case
  doctest DocumentationExample

  test "greets the world" do
    assert DocumentationExample.hello() == :world
  end
end
