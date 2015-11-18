class MovesController < ApplicationController

  def new
    @roshambo_move = Roshambo_Move.new
  end

  def create
    @roshambo_move = make_move(roshambo_move_params)
  end

  private
  def roshambo_move_params
    params.require(:roshambo_move).permit(:player, :square, :symbol)
  end

end