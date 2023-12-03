
class Board
  attr_accessor :knight, :chessboard
  def initialize
    @knight = nil
    @chessboard = init_chessboard
  end

  def init_chessboard
    @chessboard = Array.new(8){Array.new(8){Square.new}}
  end

  
  def possible_moves(x,y)
  moves = []
  moves << neighbour_exist?(x + 2, y - 1)
  moves << neighbour_exist?(x + 2, y + 1)
  moves << neighbour_exist?(x + 1, y - 2)
  moves << neighbour_exist?(x + 1, y + 2)
  moves << neighbour_exist?(x - 1, y - 2)
  moves << neighbour_exist?(x - 1, y + 2)
  moves << neighbour_exist?(x - 2, y - 1)
  moves << neighbour_exist?(x - 2, y + 1)
    moves.compact
  end
  
  def neighbour_exist?(x,y)
    (x >= 0 && x < 8) && (y >= 0 && y < 8) ? self.chessboard[x][y] : nil
  end

  def output_results(path,distance)
    puts "You made it in #{distance} moves!"
    puts "Here's your path:#{puts path}"
  end

  def knight_moves(start,destination)
    distance = 0
    path = []
    @knight = start
    queue = [@knight]
    visited = []
    until queue.empty?
      return output_results(path,distance) if queue[0] == destination
      self.chessboard.each_with_index do |sub, i|
        sub.each_with_index do |cell,j|
          if cell == queue[0] && !visited.include?(cell)
            path<<"[#{i},#{j}]"
            distance+=1
            moves = possible_moves(i,j)
            moves.each do |move|
              queue << move if !visited.include?(move)
            end
           else
            next
        end
      end
    end
    visited << queue.shift
  end

end

end
 
class Square
  attr_accessor :value
  def initialize
    @value = 0
    
  end
  
  
end


board = Board.new
start = board.chessboard[0][0]
destination = board.chessboard[3][3]
board.knight_moves(start,destination)

# def test(x,y)
  #   self.chessboard[x][y].neighbours = add_neighbours(x,y)
    

   # def test1
  #   self.chessboard.each_with_index do |sub, i|
  #     sub.each_with_index do |item, j|
  #       self.chessboard[i][j].value = 1
  #   end
  # end


  # check if @knight == destination, if so - return @knight
  #  if false, check for neighbour squares using BFS
  #  

  # def knight_moves(start,destination)
#   distance = 0
#   path = []
#   @knight = start
#   queue = [@knight]
#   visited = []
#   current = nil
#   until queue.empty?
#    self.chessboard.each_with_index do |sub, i|
#         sub.each_with_index do |item, j|
#           if item == destination
#             path << "[#{i},#{j}]"
#             distance+=1
#             output_results(path,distance)
#             break
#           elsif item == queue[0] && !visited.include?(item)
#             path << "[#{i},#{j}]"
#             distance+=1
#             moves = possible_moves(i,j)
#             moves.each do |move|
#               queue << move if !visited.include?(move)
#             end
#           else
#             next
#             end
#         end
#       end
  
#       visited << queue.shift
# end
# end

# end