# board will be a class, along with X's and O's
class GameBoard
  attr_accessor :board_hash
  attr_reader :game_over

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

  def play_game(player1, player2)
    current_player = player1
    until game_won? || board_filled?
      current_player.play_round(self)
      if game_won?
        puts "Congratulations! #{current_player.name} has won!"
        next
      elsif board_filled?
        puts "It's a tie! All spaces have been filled."
        next
      end
      if current_player == player1
        current_player = player2
      else
        current_player = player1
      end
    end
  end

  protected

  attr_writer :game_over

  def game_won?
    if board_hash['1'][:symbol] == board_hash['2'][:symbol] && board_hash['1'][:symbol] == board_hash['3'][:symbol]
      true
    elsif board_hash['1'][:symbol] == board_hash['5'][:symbol] && board_hash['1'][:symbol] == board_hash['9'][:symbol]
      true
    elsif board_hash['1'][:symbol] == board_hash['4'][:symbol] && board_hash['1'][:symbol] == board_hash['7'][:symbol]
      true
    elsif board_hash['2'][:symbol] == board_hash['5'][:symbol] && board_hash['2'][:symbol] == board_hash['8'][:symbol]
      true
    elsif board_hash['3'][:symbol] == board_hash['6'][:symbol] && board_hash['3'][:symbol] == board_hash['9'][:symbol]
      true
    elsif board_hash['3'][:symbol] == board_hash['5'][:symbol] && board_hash['3'][:symbol] == board_hash['7'][:symbol]
      true
    elsif board_hash['4'][:symbol] == board_hash['5'][:symbol] && board_hash['4'][:symbol] == board_hash['6'][:symbol]
      true
    elsif board_hash['7'][:symbol] == board_hash['8'][:symbol] && board_hash['7'][:symbol] == board_hash['9'][:symbol]
      true
    else
      false
    end
  end

  def board_filled?
    board_state = @board_hash.reduce(0) do |sum, (key, value)|
      if value[:symbol] != key
        sum += 1
      else
        sum
      end
    end
    if board_state == 9
      return true
    else
      return false
    end
  end
end

# class for all players
class Player
  @@symbols_used = []

  attr_accessor :symbol, :name

  def initialize
    puts 'Please enter your name:'
    name = gets.chomp
    puts "Please enter ONE CHARACTER that you'd like to use as your symbol."
    symbol = gets.chomp
    until symbol.length == 1 && symbol != @@symbols_used[0]
      puts 'Please only enter one character between 1 and 9. Your symbol must also not be a symbol that has already been used.'
      symbol = gets.chomp
    end
    @symbol = symbol
    @name = name
    @@symbols_used << @symbol
  end

  def place_symbol(location, gameboard)
    location = location.to_i.to_s
    location_int = location.to_i
    unless location_int <= 9 && location_int >= 1
      puts "#{location} is not between 1 and 9."
      return false
    end
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
    puts "Please select where you'd like to place your symbol, #{self.name}: #{symbol}."
    location = gets.chomp
    until place_symbol(location, gameboard)
      puts "Please select an area that hasn't been taken/is between 1 and 9."
      gameboard.print_game_board
      location = gets.chomp
    end
    gameboard.print_game_board
  end
end

newgame = GameBoard.new
player1 = Player.new
player2 = Player.new

newgame.play_game(player1, player2)
