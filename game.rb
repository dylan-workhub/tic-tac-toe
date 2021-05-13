#board will be a class, along with X's and O's
class GameBoard
  def initialize
    @board_array = [
      ["1", "|", "2", "|", "3"],
      ["---------"],
      ["4", "|", "5", "|", "6"],
      ["---------"],
      ["7", "|", "8", "|", "9"]
    ]
    self.print_game_board
  end

  protected
  def print_game_board
    @board_array.each do |row|
      puts row.join(' ')
    end
  end
end

class Player
  def initialize(symbol)
    @symbol = symbol
  end
end

newgame = GameBoard.new