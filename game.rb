# board will be a class, along with X's and O's
class GameBoard
  attr_accessor :board_hash

  def initialize
    @board_hash = {
      1 => { symbol: 1, played: false }, 2 => { symbol: 2, played: false },
      3 => { symbol: 3, played: false }, 4 => { symbol: 4, played: false },
      5 => { symbol: 5, played: false }, 6 => { symbol: 6, played: false },
      7 => { symbol: 7, played: false }, 8 => { symbol: 8, played: false },
      9 => { symbol: 9, played: false }
    }
    print_game_board
  end

  def print_game_board
    puts "#{@board_hash[1][:symbol]} | #{@board_hash[2][:symbol]} | #{@board_hash[3][:symbol]}"
    puts '---------'
    puts "#{@board_hash[4][:symbol]} | #{@board_hash[5][:symbol]} | #{@board_hash[6][:symbol]}"
    puts '---------'
    puts "#{@board_hash[7][:symbol]} | #{@board_hash[8][:symbol]} | #{@board_hash[9][:symbol]}"
  end
end

# class for all players
class Player
  def initialize(symbol)
    @symbol = symbol
  end

  def place_symbol(location) end
end

newgame = GameBoard.new
