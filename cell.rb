class Cell
  attr_reader :state, :x, :y, :app
  attr_accessor :neighbors

  def initialize(initial_state:, x:, y:, neighbors: [], app:)
    raise unless %w[dead alive].include?(initial_state)

    @state = initial_state
    @x = x
    @y = y
    @neighbors = neighbors
    @app = app
  end

  def update
    if @state != @future_state
      display(@future_state)
    end

    @state = @future_state
  end

  def compute_future_state
    if state == 'dead'
      if neighbors.select { |c| c.state == 'alive' }.count == 3
        born
      else
        remain
      end
    elsif state == 'alive'
      if neighbors.select { |c| c.state == 'alive' }.count < 2 || neighbors.select { |c| c.state == 'alive' }.count > 3
        die
      else
        remain
      end
    else
      raise 'the cell is not a schrodinger cat !'
    end
  end

  def display(state = @state)
    # app.eval_with_additional_context do |app|
      app.rect(
        fill: color(state),
        left: 25 * x,
        top: 25 * y,
        width: 25
      )
    # end
  end

  private

  def color(state)
    state == 'alive' ? '#02a552' : '#000'
  end

  def die
    @future_state = 'dead'
  end

  def born
    @future_state = 'alive'
  end

  def remain
    @future_state = @state
  end
end
