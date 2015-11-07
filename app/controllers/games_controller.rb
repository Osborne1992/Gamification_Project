class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params)
    redirect_to(games_path)
  end

  def destroy
    game = find_game
    game.destroy
    redirect_to(games_path)
  end

  def edit
    @game = find_game
  end

  def update
    game = find_game
    game.update(game_params)
    redirect_to(games_path)
  end

  private

  def find_game
    Game.find(params[:id])
  end

end