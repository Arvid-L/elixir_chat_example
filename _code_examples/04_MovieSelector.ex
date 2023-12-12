defmodule Movie do
  defstruct [:name, fsk: 18, viewer_age: ""]
end

defmodule MovieSelector do
  @list_of_movies [
    %Movie{name: "König der Löwen", fsk: 0},
    %Movie{name: "Catch me if you can", fsk: 6},
    %Movie{name: "Herr der Ringe", fsk: 12},
    %Movie{name: "Der Pate", fsk: 16},
    %Movie{name: "Reservoir Dogs", fsk: 18}
  ]

  defmodule MinimumAgeNotMetError do
    defexception message: "User ist nicht alt genug den ausgewählten Film zu sehen"
  end

  def select_movie() do
    pick_movie()
    |> enter_age()
    |> to_auth_status()
    |> handle_auth_status()
  end

  defp pick_movie() do
    IO.puts("Welchen Film wollen Sie sehen?/n")

    selected_id =
      @list_of_movies
      |> Enum.map_join(
        "\n",
        fn movie ->
          "#{Enum.find_index(@list_of_movies, &(&1 == movie)) + 1}. #{movie.name} (ab #{movie.fsk} Jahre)"
        end
      )
      |> IO.gets()
      |> parse_input()

    selected_movie = Enum.at(@list_of_movies, selected_id)

    selected_movie |> IO.inspect()
  end

  defp parse_input(input) do
    input
    |> String.trim_trailing("\n")
    |> Integer.parse()
    |> elem(0)
    |> Kernel.-(1)
  end

  defp enter_age(%{name: name, fsk: fsk} = movie) do
    viewer_age =
      IO.gets("Wie alt sind Sie?\n")
      |> parse_input()

    %Movie{movie | viewer_age: viewer_age}
  end

  defp to_auth_status(%Movie{name: name, fsk: fsk, viewer_age: viewer_age} = movie)
       when viewer_age >= fsk do
    {:ok, "Authorized"}
  end

  defp to_auth_status(%Movie{name: name, fsk: fsk, viewer_age: viewer_age} = movie)
       when viewer_age < fsk do
    {:error, MinimumAgeNotMetError}
  end

  defp handle_auth_status(auth_status) do
    case auth_status do
      {:ok, message} -> IO.puts(message)
      {:error, error} -> raise error
    end
  end
end

MovieSelector.select_movie()
