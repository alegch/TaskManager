class ApplicationController < ActionController::Base
  protect_from_forgery

  include AuthHelper

  helper_method :current_user

end
