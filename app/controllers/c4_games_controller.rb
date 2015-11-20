class C4GamesController < ApplicationController

  def index
    @c4_games = C4Game.all.order('id desc')
  end

  def new
    @c4_game = C4Game.new
    @c4_game.player1_id = current_user.id
  end

  def create
    c4_game = C4Game.create(c4_game_params)
    redirect_to(c4_game_path(c4_game))
  end

  def update
    c4_game = C4Game.find(params[:id])
    c4_game.make_move(current_user, params[:square])
    redirect_to(c4_game_path(c4_game))
  end

  def show
    @c4_game = C4Game.find(params[:id])
  end

  private
  def c4_game_params
    params.require(:c4_game).permit(:player1_id, :player2_id)
  end

end