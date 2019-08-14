
Shoes.app width: 300, height: 300 do
  require './game'

  stack do
    para "Welcome to the game of life"

    g = Game.new(board_size: 10, iterations_number: 10, app: self)
    g.display

    button "Click me" do
      g.start
    end
  end
end
