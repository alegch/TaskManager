class Web::UsersController < Web::ApplicationController

  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new(params[:user_registration_type])
    if @user.save
      flash_success
      redirect_to root_url
    else
      flash_error
      render action: 'new'
    end
  end

end
