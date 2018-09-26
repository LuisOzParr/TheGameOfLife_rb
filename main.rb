require 'interface' #GEMA :D
require './classes/Neighbors'
require './classes/Cell'


cell = Cell.new(10)
margin = Interface::Margin.new

loop do
  system "cls"
  margin.create_margin(cell.getMatrix)
  cell.createNewMatrix
  sleep 1
end


