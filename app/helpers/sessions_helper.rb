module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def test

  end

  private

  def authenticate_user
    redirect_to signin_path unless logged_in?
  end

  def registered_user
    redirect_to projects_path if logged_in?
  end
end