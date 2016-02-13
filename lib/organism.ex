defmodule Organism do
  defstruct cells: nil

  def neighbors(%Organism{cells: cells}, [x: x, y: y]) do
    for position_x <- (x - 1)..(x + 1),
        position_y <- (y - 1)..(y + 1),
        position_x in 0..(length(cells) - 1) and
        position_y in 0..(length(cells) - 1) and
        not(position_x == x and position_y == y)
    do
      cells
      |> Enum.at(position_x)
      |> Enum.at(position_y)
    end
  end

  def living_neighbors_for_cell_in_position(%Organism{} = organism, position) do
    neighbors(organism, position)
    |> Enum.count(fn(x) -> x == 1 end)
  end
end
