class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    Player.create(player_params)
    redirect_to(player_index_path)
  end

  def destroy
    player = find_player
    player.destroy
    redirect_to(player_index_path)
  end

  def edit
    @player = find_player
  end

  def update
    player = find_player
    player.update(player_params)
    redirect_to(player_index_path)
  end

  private
  def find_player
    Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:player1, :playera)
  end

end