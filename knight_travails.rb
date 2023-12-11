class Board
  attr_accessor :chessboard
  def initialize
    @chessboard = Array.new(8){Array.new(8){Square.new}}
  end

  def knight_moves(start,destination)
    queue = [start]
    visited = []
    until queue.empty?

     current_cell = queue.shift
     return current_cell if current_cell == destination
     
     self.chessboard.each_with_index do |row,i|
      row.each_with_index do |cell,j|
        if cell == current_cell && !visited.include?(cell)
          puts "[#{i},#{j}]"
          moves = adjacent_squares(i,j)
          moves.select!{|move| !visited.include?(move)}
          queue.concat(moves)
        end
      end
    end
    visited << current_cell
  end
    end

  
  def adjacent_squares(i,j)
    moves = []
    possible_moves = [
      [i + 2, j + 1], [i + 2, j - 1], [i - 2, j + 1], [i - 2, j - 1],
      [i - 1, j + 2], [i - 1, j - 2], [i + 1, j - 2], [i + 1, j + 2]
    ]
    possible_moves.each do |move|
      x,y = move
      moves << valid_move?(x,y)
    end
    moves.compact
  end

  def valid_move?(x,y)
    x.between?(0,7) && y.between?(0,7) ? self.chessboard[x][y] : nil
  end

end

class Square

end

board = Board.new
start = board.chessboard[3][3]
destination = board.chessboard[3][3]
board.knight_moves(start,destination)
