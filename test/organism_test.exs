defmodule OrganismTest do
  use ExUnit.Case
  doctest Organism

  setup context do
    {:ok, [cells: [[0, 0, 0], [0, 1, 0], [1, 0, 1]], position: context[:position]]}
  end

  @tag position: []
  test "given an organism with an initial state of [[0, 0, 0], [0, 1, 0], [1, 0, 1]] it should return a new Organism structure", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    assert ^cells = organism.cells, "There was something wrong with initialization"
  end

  @tag position: [x: 0, y: 0]
  test "given a cell in position [0, 0], it should return three neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    neighbors = Organism.neighbors(organism, context[:position])

    assert 3 = length(neighbors)
  end

  @tag position: [x: 1, y: 0]
  test "given a cell in position [1, 0], it should return five neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    neighbors = Organism.neighbors(organism, context[:position])

    assert 5 = length(neighbors)
  end

  @tag position: [x: 2, y: 2]
  test "given a cell in position [2, 2], it should return three neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    neighbors = Organism.neighbors(organism, context[:position])

    assert 3 = length(neighbors)
  end

  @tag position: [x: 1, y: 1]
  test "given a cell in position [1, 1], it should return eight neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    neighbors = Organism.neighbors(organism, context[:position])

    assert 8 = length(neighbors)
  end

  @tag position: [x: 1, y: 1]
  test "given a cell in position [1, 1], and with distribution [[0, 0, 0], [0, 1, 0], [1, 0, 1]] should obtain his living neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    living_neighbors = Organism.living_neighbors_for_cell_in_position(organism, context[:position])

    assert 2 = living_neighbors
  end

end
