class SessionsController < ApplicationController
  before_action :registered_user, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to projects_path
    else
      flash.now[:danger] = "Invalid combination Email/Password."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end