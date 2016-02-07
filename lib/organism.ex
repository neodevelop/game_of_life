defmodule Organism do
  defstruct cells: nil

  def neighbors(%Organism{cells: _cells}, [x: x, y: y]) do
    IO.puts "cell at: {x: #{x}, y: #{y}}"
    for position_x <- (x - 1)..(x + 1),
        position_y <- (y - 1)..(y + 1),
        position_x > -1 and position_y > -1
        do
        IO.puts "{x: #{position_x}, y: #{position_y}}"
    end
    IO.puts "**********************"

    case {x, y} do
      {0, 0} -> [0, 0, 0]
      {0, 1} -> [0, 0, 0, 0, 0]
      {0, 2} -> [0, 0, 0]

      {1, 0} -> [0, 0, 0, 0, 0]
      {1, 1} -> [0, 0, 0, 0, 0, 0, 0, 0]
      {1, 2} -> [0, 0, 0, 0, 0]

      {2, 0} -> [0, 0, 0]
      {2, 1} -> [0, 0, 0, 0, 0]
      {2, 2} -> [0, 0, 0]
      _ -> []
    end
  end
end
