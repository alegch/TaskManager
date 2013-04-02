module AuthHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to login_url, :alert => "You must first log in to access this page"
    end
  end

end
