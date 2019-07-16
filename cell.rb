class Cell
  attr_reader :state, :x, :y
  attr_accessor :neighbors

  def initialize(initial_state:, x:, y:, neighbors: [])
    raise unless %w[dead alive].include?(initial_state)

    @state = initial_state
    @x = x
    @y = y
    @neighbors = neighbors
  end

  def update
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

  def display
    print "    ".bg(color)
  end

  private

  def color
    @state == 'alive' ? '#02a552' : '#000'
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
