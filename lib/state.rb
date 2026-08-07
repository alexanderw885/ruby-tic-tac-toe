# frozen_string_literal: true

class State
  def initialize
    @players = Array.new(2)
    @players[0] = Player.new(:X)
    @players[1] = Player.new(:O)
    @current_player = 0
    @board = Board.new
  end

  def handle_user_input
    success = false
    until success
      print "Enter the coordinates of the square you'd like to play\n"
      input = State.to_coords(gets.chomp)
      next unless input

      success = @board.place_marker(@players[@current_player], input)
      print 'Cannot play at that square. Try again\n' unless success
    end
  end

  def play_turn
    print "---------------------\n"
    print "Player #{@current_player + 1}'s turn!\n"
    print @board
    handle_user_input
    @current_player = @current_player == 1 ? 0 : 1
  end

  def self.to_coords(input)
    chars = input.chars.sort
    chars[0] = chars[0].to_i - 1
    chars[1] = chars[1].downcase.ord - 97
    if chars[0].between?(0, 2) &&
       chars[1].between?(0, 2)
      return chars.reverse
    end

    false
  end

  def to_s
    out = @board.to_s
    out += "Current player: Player #{@current_player}\n"
    out
  end
end
