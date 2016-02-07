defmodule OrganismTest do
  use ExUnit.Case
  doctest Organism

  setup do
    {:ok, cells: [[0, 0, 0], [0, 1, 0], [1, 0, 1]]}
  end

  test "given an organism with an initial state of [[0, 0, 0], [0, 1, 0], [1, 0, 1]] it shuold return a new Organism structure", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    assert ^cells = organism.cells, "There was something wrong with initialization"
  end

  test "given a cell in position [0, 0], it should return three neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    neighbors = Organism.neighbors(organism, [x: 0, y: 0])

    assert 3 = length(neighbors)
  end

  test "given a cell in position [0, 1], it should return five neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    neighbors = Organism.neighbors(organism, [x: 0, y: 1])

    assert 5 = length(neighbors)
  end

end
