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
    begin
      @current_user = User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      @current_user = nil
      sign_out
      Rails.logger.info "Destroy session for nonexistent user with id #{ session[:user_id] }"
    end
  end

  def authenticate_user!
    if current_user.nil?
      flash[:notice] = 'You must first log in to access this page'
      redirect_to new_session_path
    end
  end

end
