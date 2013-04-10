class Web::SessionsController < Web::ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      flash[:notice] = 'Logged in!'
      redirect_to root_url
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'Logged out!'
    redirect_to root_url
  end

end
