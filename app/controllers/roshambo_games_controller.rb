class RoshamboGamesController < ApplicationController

  def index
    @roshambo_games = RoshamboGame.all.order('id desc')
  end

  def new
    @roshambo_game = RoshamboGame.new
    @roshambo_game.player1_id = current_user.id
  end

  def create
    roshambo_game = RoshamboGame.create(roshambo_game_params)
    redirect_to(roshambo_game_path(roshambo_game))
  end

  def update
    roshambo_game = RoshamboGame.find(params[:id])
    roshambo_game.make_move(current_user, params[:square])
    redirect_to(roshambo_game_path(roshambo_game))
  end

  def show
    @roshambo_game = RoshamboGame.find(params[:id])
  end

  private
  def roshambo_game_params
    params.require(:roshambo_game).permit(:player1_id, :player2_id)
  end

end