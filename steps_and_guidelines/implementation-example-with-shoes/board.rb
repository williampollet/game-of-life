require './cell'

class Board
  attr_reader :cells, :size, :app

  def initialize(size:, app:)
    @cells = []
    @size = size
    @app = app
  end

  def reset
    @cells = []
  end

  def populate
    (0..size-1).each do |x|
      (0..size-1).each do |y|
        @cells << Cell.new(initial_state: %w[dead alive].sample ,x: x,y: y, app: app)
      end
    end

    @cells.each do |cell|
      cell.neighbors = @cells.select do |c|
        ((c.x == cell.x + 1 || c.x == cell.x - 1) && (c.y == cell.y + 1 || c.y == cell.y - 1 || c.y == cell.y)) ||
          (c.x == cell.x && (c.y == cell.y + 1 || c.y == cell.y - 1))
      end
    end
  end

  def display
   (0..size-1).reverse_each do |y|
      (0..size-1).each do |x|
        @cells.select{ |c| c.x == x && c.y == y }.first.display(initial_display: true)
      end
    end
  end

  def update
    @cells.each do |cell|
      cell.compute_future_state
    end

    @cells.each do |cell|
      cell.update
    end
  end
end
