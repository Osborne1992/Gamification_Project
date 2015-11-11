module ApplicationHelper
  def board_square_contents(game, square)
    if game.has_move_at_square(square)
      game.move_at_square(square).symbol
    else
      form_tag({action: :update, params: {square: square}}, method: :patch) do
        button_tag '?', class: "TTTButton"
      end
    end
  end

end
