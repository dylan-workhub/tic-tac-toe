# board will be a class, along with X's and O's
class GameBoard
  attr_accessor :board_hash, :game_over

  def initialize
    @board_hash = {
      '1' => { symbol: '1', played: false }, '2' => { symbol: '2', played: false },
      '3' => { symbol: '3', played: false }, '4' => { symbol: '4', played: false },
      '5' => { symbol: '5', played: false }, '6' => { symbol: '6', played: false },
      '7' => { symbol: '7', played: false }, '8' => { symbol: '8', played: false },
      '9' => { symbol: '9', played: false }
    }
    @game_over = false
    print_game_board
  end

  def print_game_board
    puts "#{@board_hash['1'][:symbol]} | #{@board_hash['2'][:symbol]} | #{@board_hash['3'][:symbol]}"
    puts '---------'
    puts "#{@board_hash['4'][:symbol]} | #{@board_hash['5'][:symbol]} | #{@board_hash['6'][:symbol]}"
    puts '---------'
    puts "#{@board_hash['7'][:symbol]} | #{@board_hash['8'][:symbol]} | #{@board_hash['9'][:symbol]}"
  end
end

# class for all players
class Player
  def initialize
    puts "Please enter ONE CHARACTER that you'd like to use as your symbol."
    symbol = gets.chomp
    until symbol.length == 1
      puts 'Please only enter one character.'
      symbol = gets.chomp
    end
    @symbol = symbol
  end

  def place_symbol(location, gameboard)
    if gameboard.board_hash[location][:played] == true
      puts "#{location} has already been taken."
      return false
    end

    gameboard.board_hash[location][:symbol] = @symbol
    gameboard.board_hash[location][:played] = true
    true
  end

  def play_round(gameboard)
    gameboard.print_game_board
    puts "Please select where you'd like to place your symbol."
    location = gets.chomp
    until place_symbol(location, gameboard)
      puts "Please select an area that hasn't been taken."
      gameboard.print_game_board
      location = gets.chomp
    end
    gameboard.print_game_board
  end
end

newgame = GameBoard.new
keff = Player.new

keff.play_round(newgame)
keff.play_round(newgame)
