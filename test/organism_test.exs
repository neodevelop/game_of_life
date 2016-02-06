defmodule Organism do
  use ExUnit.Case
  doctest Organism

  test "given an organism with an initial size of 3 it should return a tuple of tuples with the same size x = y = 3" do
    organism = Organism.create(3)
    assert [[0, 0, 0], [0, 0, 0], [0, 0, 0]] = organism, "There was something wrong with initialization"
  end
end
