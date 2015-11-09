class GamesController < ApplicationController

  def index

  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params)
    redirect_to(game_path(game))
  end

  private
  def game_params
    params.require(:game).permit(:player1_id, :player2_id)
  end

end