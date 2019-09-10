require './board'

class Game
  attr_reader :board, :iterations_number, :app
  attr_accessor :off

  def initialize(board_size:, iterations_number:, app:)
    @board = Board.new(size: board_size, app: app)
    @board.populate
    @iterations_number = iterations_number
    @app = app
    @off = false
  end

  def display
    board.display
  end

  def reset
    board.reset
    board.populate
    app.animate do |i|
      board.display
    end
  end

  def start
    @off = false

    (0..iterations_number).each do |iteration|
      break if @off

      app.animate do |i|
        board.update
      end
    end
  end
end
