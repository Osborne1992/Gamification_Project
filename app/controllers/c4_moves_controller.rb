class MovesController < ApplicationController

  def new
    @c4_move = C4Move.new
  end

  def create
    @c4_move = make_move(c4_move_params)
  end

  private
  def c4_move_params
    params.require(:c4_move).permit(:player, :square, :token)
  end

end