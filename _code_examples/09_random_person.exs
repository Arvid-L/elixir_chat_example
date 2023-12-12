names_of_members_of_the_best_trait = [
  "Thilo Martens",
  "Jocelyn Proctor",
  "Simar Burkart",
  # "Arvid Lindenau",
  "Johanna Werhahn",
  "Annika Wiegand",
  "Richardt Joergensen",
  "Michael Tornack",
  "Dirk Ehrenschwender",
  "Matti Waack",
  "Lukas Hartrumpf",
  "Jeremia Nöbel"
]

next_date = ~D[2024-01-02]

Enum.random(names_of_members_of_the_best_trait)
|> Kernel.<>(
  " macht die nächste Trait-Präsentation am #{next_date.day}. #{next_date.month}.#{next_date.year}"
)
|> IO.inspect()
