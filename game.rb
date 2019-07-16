require './board'
require 'tco'

class Game
  attr_reader :board, :iterations_number
  def initialize(board_size:, iterations_number:)
    @board = Board.new(size: board_size)
    @board.populate
    @iterations_number = iterations_number
  end

  def start
    board.display
    (0..iterations_number).each do |iteration|
      board.update
    end
    board.display
  end
end
