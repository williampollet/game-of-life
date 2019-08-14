require './board'

class Game
  attr_reader :board, :iterations_number, :app
  def initialize(board_size:, iterations_number:, app:)
    @board = Board.new(size: board_size, app: app)
    @board.populate
    @iterations_number = iterations_number
    @app = app
  end

  def display
    board.display
  end

  def start
    (0..iterations_number).each do |iteration|
      board.update
    end
  end
end
