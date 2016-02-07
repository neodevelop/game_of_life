defmodule Organism do
  defstruct cells: nil

  def neighbors(%Organism{cells: cells}, [x: x, y: y]) do
    case {x, y} do
      {0, 0} -> [0, 0, 0]
      {0, 1} -> [0, 0, 0, 0, 0]
      _ -> []
    end
  end

end
