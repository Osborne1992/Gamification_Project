class MovesController < ApplicationController

  def new
    @move = Move.new
  end

  def create
    Move.create(move_params)
    redirect_to(moves_path)
  end

  def destroy
    move = find_move
    move.destroy
    redirect_to(moves_path)
  end

  def edit
    @move = find_move
  end

  def update
    move = find_move
    move.update(move_params)
    redirect_to(moves_path)
  end

  private
  def find_move
    Move.find(params[:id])
  end

  private
  def move_params
    params.require(:move).permit(:player, :square, :symbol)
  end

end