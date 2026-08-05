class Board
  def initialize
    @state = Array.new(3)
    @state.map! { Array.new(3, ' ') }
  end

  def place_marker(player_id, row, col)
    return false unless @state[row][col].eql?(' ')

    @state[row][col] = player_id.to_s
    true
  end

  def to_s
    out = "\n"
    @state.each_with_index do |row, i|
      out += " #{row.join(' | ')}\n"
      out += "---+---+---\n" if i < 2
    end
    out += "\n"
    out
  end
end
