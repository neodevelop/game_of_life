defmodule OrganismTest do
  use ExUnit.Case
  doctest Organism

  test "given an organism with an initial state of [[0, 0, 0], [0, 0, 0], [0, 0, 0]] it shuold return a new Organism structure" do
    cells = [[0, 0, 0], [0, 1, 0], [1, 0, 1]]
    organism = %Organism{cells: cells}
    assert ^cells = organism.cells, "There was something wrong with initialization"
  end

  test "given the cell in position [0, 0], it should return three neighbors" do
    cells = [[0, 0, 0], [0, 1, 0], [1, 0, 1]]
    organism = %Organism{cells: cells}
    neighbors = Organism.neighbors(organism, [x: 0, y: 0])

    assert 3 = length neighbors
  end

end
