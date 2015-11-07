class PlayersController < ApplicationController
  
  has_many :moves

  def new
    @player = Player.new
  end

  def create
    Player.create(player_params)
    redirect_to(players_path)
  end

  def destroy
    player = find_player
    player.destroy
    redirect_to(players_path)
  end

  def edit
    @player = find_player
  end

  def update
    player = find_player
    player.update(player_params)
    redirect_to(players_path)
  end

  private
  def find_player
    Player.find(params[:id])
  end

end