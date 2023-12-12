# Immutability

defmodule Immutability do
  def immutable_list(list) do
    sorted_list =
      list
      |> Enum.sort()

    list_with_first_zero_deleted =
      list
      |> List.delete(0)

    list_with_first_element_deleted =
      list
      |> List.delete_at(0)

    IO.inspect(list)
    IO.inspect(sorted_list)
    IO.inspect(list_with_first_zero_deleted)
    IO.inspect(list_with_first_element_deleted)
  end
end

Immutability.immutable_list([7, 8, 12, 0, 1, 0])
