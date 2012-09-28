class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    if session[:logged_in]
      User.new
    else
      nil
    end
  end
end
