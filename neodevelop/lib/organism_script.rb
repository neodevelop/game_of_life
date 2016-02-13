require './organism'

file = File.open("organism1.txt","r")
population = file.readlines.collect do |s|
  s.gsub('*','1').gsub('-','0').chars.collect do |n| n.to_i end
end

organism = Organism.new
organism.feed population


1000.times do |i|
  system "clear"
  puts organism.show
  organism.prepare_to_evolve
  organism.evolve
  sleep 0.055555
end
