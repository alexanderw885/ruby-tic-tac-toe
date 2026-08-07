# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/state'

state = State.new
5.times { state.play_turn }

print state
