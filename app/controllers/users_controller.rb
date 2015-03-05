class UsersController < ApplicationController
  before_action :registered_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome aboard!"
      session[:user_id] = @user.id
      redirect_to projects_path
    else
      flash.now[:danger] = "The form contains some errors."
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end