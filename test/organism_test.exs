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

  @tag position: [x: 0, y: 2]
  test "given a cell in position [1, 1], and with distribution [[0, 0, 0], [0, 1, 0], [1, 0, 1]] should obtain two living neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}
    living_neighbors = Organism.living_neighbors_for_cell_in_position(organism, context[:position])

    assert 1 = living_neighbors
  end

  # Rule 1.- Any live cell with fewer than two live neighbours dies, as if caused by under-population
  @tag position: [x: 0, y: 2]
  test "given a cell in position [0, 2], should die because has fewer than two live neighbors", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}

    cell_should_die = Organism.cell_die_cause_under_population?(organism, context[:position])

    assert true = cell_should_die
  end

  # Any live cell with two or three live neighbours lives on to the next generation
  @tag position: [x: 1, y: 1]
  test "given a cell in position [1, 1], should live on to the next generation", context do
    cells = context[:cells]
    organism = %Organism{cells: cells}

    cell_should_live = Organism.cell_lives_on_next_generation?(organism, context[:position])

    assert true = cell_should_live
  end

  # Any live cell with more than three live neighbours dies, as if by over-population
  @tag position: [x: 1, y: 1]
  test "given a cell in position [1, 1], should die because has more than three neighbors", context do
    cells = [[0, 0, 0], [0, 1, 1], [1, 1, 1]]
    organism = %Organism{cells: cells}

    cell_should_die = Organism.cell_die_cause_over_population?(organism, context[:position])

    assert true = cell_should_die
  end

end
