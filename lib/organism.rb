class Organism

  attr_accessor :cells

  def initialize
    @cells = [[0,0,0],[0,1,0],[1,0,1]]
  end

  def populate(cells)
    @cells = cells
  end

  def evolve
    @cells.each_with_index do | row, index |
      row.each_with_index do |element, indx |
        p element
      end
    end
  end

  def find_neighbors(position)
    x = position[0]
    y = position[1]

    neighbors = []

    (-1..1).each do | i |
      (-1..1).each do | j |
        p "#{x+i} #{y+j}" 
        if (x+i >= 0) && (y+j >= 0) then
          if (x+i != x) && (y+j != y) then
            neighbors << @cells[x+i][y+j]
          end
        end
      end
    end
    p neighbors

    neighbors
    #if(position == [0, 0]) then
    #  [0, 0, 0]
    #else 
    #  if(position == [0, 1]) then
    #    [0, 0, 0, 0, 0]
    #  else
    #    if(position == [0, 2]) then
    #      [0, 0, 0]
    #    else
    #      if(position == [1, 0]) then
    #        [0, 0, 0,0,0]
    #      end
    #    end
    #  end
    #end
  end

end