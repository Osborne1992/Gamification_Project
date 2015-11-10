class MovesController < ApplicationController

  def new
    @move = Move.new
  end

  def create
    @move = make_move(move_params)
  end

  private
  def move_params
    params.require(:move).permit(:player, :square, :symbol)
  end

end