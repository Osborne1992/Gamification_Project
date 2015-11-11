class GamesController < ApplicationController

  def index
    @games = Game.all.order('id desc')
  end

  def new
    @game = Game.new
    @game.player1_id = current_user.id
  end

  def create
    game = Game.create(game_params)
    redirect_to(game_path(game))
  end

  def update
    game = Game.find(params[:id])
    game.make_move(current_user, params[:square])
    redirect_to(game_path(game))
  end

  def show
    @game = Game.find(params[:id])
  end

  private
  def game_params
    params.require(:game).permit(:player1_id, :player2_id)
  end

end