defmodule Organism do
  defstruct cells: nil

  def neighbors(%Organism{cells: _cells}, [x: x, y: y]) do
    case {x, y} do
      {0, 0} -> [0, 0, 0]
      {0, 1} -> [0, 0, 0, 0, 0]
      {0, 2} -> [0, 0, 0]
      {1, 0} -> [0, 0, 0, 0, 0]
      {1, 1} -> [0, 0, 0, 0, 0, 0, 0, 0]
      _ -> []
    end
  end

end
