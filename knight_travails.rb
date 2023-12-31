class Board
  attr_accessor :chessboard

  def initialize
    @chessboard = Array.new(8) { Array.new(8) { Square.new } }
  end

  def knight_moves(start, destination)
    queue = [start]
    visited = []
    path = []
    until queue.empty?

      current_cell = queue.shift
      path << current_cell
      return reconstruct_path(path, destination) if current_cell == destination

      process_path(queue, visited, current_cell)

    end
    puts 'No path found.'
  end

  def process_path(queue, visited, current_cell)
    chessboard.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        next unless cell == current_cell && !visited.include?(cell)

        moves = adjacent_squares(x, y)
        moves.select! { |move| !visited.include?(move) }
        moves.each { |move| move.pointer = current_cell }
        queue.concat(moves)
      end
    end
    visited << current_cell
  end

  def adjacent_squares(x, y)
    moves = []
    possible_moves = [
      [x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1],
      [x - 1, y + 2], [x - 1, y - 2], [x + 1, y - 2], [x + 1, y + 2]
    ]
    possible_moves.each do |move|
      x, y = move
      moves << valid_move?(x, y)
    end
    moves.compact
  end

  def valid_move?(x, y)
    return unless x.between?(0, 7) && y.between?(0, 7)

    chessboard[x][y].coord = "[#{x},#{y}]"
    chessboard[x][y]
  end

  def reconstruct_path(path, destination)
    from_destination = path.find { |square| square == destination }
    distance = 0
    coordinates = []
    while from_destination
      coordinates << from_destination.coord
      from_destination = from_destination.pointer
      distance += 1
    end
    puts "You made it in #{distance} moves!  Here's your path: "
    coordinates.reverse.each { |coord| puts coord }
  end
end

class Square
  attr_accessor :pointer, :coord

  def initialize
    @pointer = nil
    @coord = nil
  end
end

board = Board.new
start = board.chessboard[3][3]
destination = board.chessboard[7][7]
board.knight_moves(start, destination)
