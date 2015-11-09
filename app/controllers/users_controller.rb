class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to(user_index_path)
  end

  def destroy
    user = find_user
    user.destroy
    redirect_to(user_index_path)
  end

  def edit
    @user = find_user
  end

  def update
    user = find_user
    user.update(user_params)
    redirect_to(user_index_path)
  end

  private
  def find_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

end