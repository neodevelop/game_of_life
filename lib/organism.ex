defmodule Organism do
  defstruct cells: nil

  def new(data) when is_list(data), do: %Organism{cells: data}

  def neighbors(%Organism{cells: cells}, [x: x, y: y]) do
    for position_x <- (x - 1)..(x + 1),
        position_y <- (y - 1)..(y + 1),
        position_x in 0..(length(cells) - 1) and
        position_y in 0..(length(cells) - 1) and
        not(position_x == x and position_y == y)
    do
      cell_status(cells, position_x, position_y)
    end
  end

  def living_neighbors_for_cell_in_position(%Organism{} = organism, position) do
    neighbors(organism, position)
    |> Enum.count(&(&1 == 1))
  end

  def cell_die_cause_under_population?(%Organism{} = organism, position) do
    living_neighbors_for_cell_in_position(organism, position) < 2
  end

  def cell_lives_on_next_generation?(%Organism{} = organism, position) do
    living_neighbors_for_cell_in_position(organism, position) == 2 or living_neighbors_for_cell_in_position(organism, position) == 3
  end

  def cell_die_cause_over_population?(%Organism{} = organism, position) do
    living_neighbors_for_cell_in_position(organism, position) > 3
  end

  def reborn_cell?(%Organism{} = organism, position) do
    living_neighbors_for_cell_in_position(organism, position) == 3
  end

  def next(%Organism{} = organism) do
    size = length(organism.cells)
    cells = for x <- 0..(size - 1) do
      for y <- 0..(size - 1) do
        case {cell_status(organism.cells, x, y),
              cell_die_cause_under_population?(organism, [x: x, y: y]),
              cell_die_cause_over_population?(organism, [x: x, y: y]),
              cell_lives_on_next_generation?(organism, [x: x, y: y]),
              reborn_cell?(organism, [x: x, y: y])
            } do
          {1, true, _, _, _} -> 0
          {1, _, true, _, _} -> 0
          {1, _, _, true, _} -> 1
          {0, _, _, _, true} -> 1
          _ -> 0
        end
      end
    end
    %Organism{cells: cells}
  end

  def cell_status(cells, x, y) do
    cells
    |> Enum.at(x)
    |> Enum.at(y)
  end

end
