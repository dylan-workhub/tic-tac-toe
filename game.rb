#board will be a class, along with X's and O's

class GameBoard
  @board_array = [["1", "|", "2", "|", "3"], ["---------"], ["4", "|", "5", "|", "6"],["---------"], ["7", "|", "8", "|", "9"]]

  def initialize

  end

  private
  def print_game_board
    @board_array.each do |row|
      puts row.join(' ')
    end
  end
end