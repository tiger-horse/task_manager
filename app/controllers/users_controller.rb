class UsersController < ApplicationController
  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @rooms = current_user.rooms
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
