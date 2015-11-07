class BoardsController < ApplicationController
  has_many :moves

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
    redirect_to(boards_path)
  end

  def destroy
    board = find_board
    board.destroy
    redirect_to(boards_path)
  end

  def edit
    @board = find_board
  end

  def update
    board = find_board
    board.update(board_params)
    redirect_to(boards_path)
  end

  private

  def find_board
    Board.find(params[:id])
  end

end