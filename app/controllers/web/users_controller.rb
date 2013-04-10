class Web::UsersController < Web::ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Signed up!'
      redirect_to root_url
    else
      render new_user_path
    end
  end

end
