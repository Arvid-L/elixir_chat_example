defmodule DocumentationExample do
  @moduledoc """
  ...
  """

  @doc """
  Prints a hello message.

  ## Parameters

    - name: String that represents the name of the person.

  ## Examples

      iex> DocumentationExample.hello("Sean")
      "Hello, Sean"

      iex> DocumentationExample.hello("pete")
      "Hello, pete"

  """
  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, " <> name
  end
end
