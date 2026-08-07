# frozen_string_literal: true

class Board
  def initialize
    @state = Array.new(3)
    @state.map! { Array.new(3, ' ') }
  end

  def place_marker(player, coords)
    return false unless @state[coords[0]][coords[1]].eql?(' ')

    @state[coords[0]][coords[1]] = player.id.to_s
    true
  end

  def to_s
    out = "   1   2   3 \n\n"
    @state.each_with_index do |row, i|
      letter = (i + 65).chr
      out += "#{letter}  #{row.join(' | ')}\n"
      out += "  ---+---+---\n" if i < 2
    end
    out += "\n"
    out
  end
end
