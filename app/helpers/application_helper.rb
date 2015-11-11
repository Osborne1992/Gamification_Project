module ApplicationHelper
  def board_square_contents(game, square)
    if game.has_move_at_square(square)
      game.move_at_square(square).symbol
    else
      if game.can_make_move?(current_user)
      form_tag({action: :update, params: {square: square}}, method: :patch) do
        button_tag '?', class: "TTTButton"
      end
      end
    end
  end

end
