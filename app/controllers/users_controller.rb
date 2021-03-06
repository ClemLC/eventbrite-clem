class UsersController < ApplicationController
  def show
    @user_event=current_user.created_events.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = "Hey ! Bienvenu sur Eventbrite by Clem !"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
