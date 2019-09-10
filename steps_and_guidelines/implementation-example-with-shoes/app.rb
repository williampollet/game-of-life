
Shoes.app width: 300, height: 600 do
  require './game'

  stack do
    para "Welcome to the game of life"

    stack('right') do
      button 'Prepare the game' do
        @iterations_number = 100
        @board_size = 10
        it_para = para "Itérations: #{@iterations_number}\n"
        b_s_para = para "Taille du plateau: #{@board_size}\n"

        para 'sélectionner le nombre d\'itérations'
        flow do
          it_l = edit_line
          button 'ok' do
            @iterations_number = it_l.text.to_i
            it_para.replace "Itérations: #{@iterations_number}\n"
          end
        end

        para 'définir la taille du plateau'
        flow do
          b_s = edit_line
          button 'ok' do
            @board_size = b_s.text.to_i
            b_s_para.replace "Taille du plateau: #{@board_size}\n"
          end
        end

        button 'Set up' do
          @game = Game.new(
            board_size: @board_size,
            iterations_number: @iterations_number,
            app: self
          )

          para "\n\n"

          @game.display

          button "Start" do
            @game.start
          end

          button "Stop" do
            @game.off = true
          end

          button "Reset" do
            @game.reset
          end
        end
      end
    end
  end
end
