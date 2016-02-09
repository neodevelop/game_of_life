require "organism"

RSpec.describe Organism do 
  organism = Organism.new


  ##it "should evolve an organism with first rule" do
  ##  organism.populate([[0,0,0],[0,1,0],[1,0,1]])
  ##  organism.evolve
  ##  expect(organism.cells).to eq([[0, 0, 0],[0, 1, 0],[0, 0, 0]])
  ##end

  it "given a cell in position [0,0] should return 3 neighbors" do
    neighbors = organism.find_neighbors([0,0])
    expect(neighbors.size()).to eq(3)
  end

  it "given a cell in position [0,1] should return 5 neighbors" do
    neighbors = organism.find_neighbors([0,1])
    expect(neighbors.size()).to eq(5)
  end

  it "given a cell in position [0,2] should return 3 neighbors" do
    neighbors = organism.find_neighbors([0, 2])
    expect(neighbors.size()).to eq(3)
  end

  it "given a cell in position [1,0] should return 5 neighbors" do
    neighbors = organism.find_neighbors([1, 0])
    expect(neighbors.size()).to eq(5)
  end


end