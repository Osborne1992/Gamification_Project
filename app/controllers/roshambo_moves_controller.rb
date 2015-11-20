class MovesController < ApplicationController

  def new
    @roshambo_move = RoshamboMove.new
  end

  def create
    @roshambo_move = make_move(roshambo_move_params)
  end

  private
  def roshambo_move_params
    params.require(:roshambo_move).permit(:player, :shape)
  end

end