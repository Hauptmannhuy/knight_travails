
class Board
  attr_accessor :knight, :chessboard
  def initialize
    @knight = nil
    @chessboard = init_chessboard
  end

  def init_chessboard
    @chessboard = Array.new(8){Array.new(8) { Square.new}}

    self.chessboard.each_with_index do |sub, i|
      sub.each_with_index do |item, j|
      self.chessboard[i][j].neighbours = add_neighbours(i,j)
      end
    end
    
  end

  
  def add_neighbours(x,y)
    neighbours = []
    
    neighbours << neighbour_exist?(x - 2, y + 1)
    neighbours << neighbour_exist?(x - 2, y - 1)
    neighbours << neighbour_exist?(x + 2, y + 1)
    neighbours << neighbour_exist?(x + 2, y - 1)
    neighbours << neighbour_exist?(x - 1, y + 2)
    neighbours << neighbour_exist?(x - 1, y - 2)
    neighbours << neighbour_exist?(x + 1, y - 2)
    neighbours << neighbour_exist?(x + 1, y + 2)
    
    neighbours.compact 
  end
  
  def neighbour_exist?(x,y)
    (x >= 0 && x < 8) && (y >= 0 && y < 8) ? self.chessboard[x][y] : nil
  end
  
  def test(x,y)
    self.chessboard[x][y].neighbours = add_neighbours(x,y)
    
  end
  def test1
    self.chessboard.each_with_index do |sub, i|
      sub.each_with_index do |item, j|
        self.chessboard[i][j].value = 1
    end
  end
end

end

class Square
  attr_accessor :value, :neighbours
  def initialize
    @value = 'square'
    @neighbours = nil
  end
  
  
end


board = Board.new


