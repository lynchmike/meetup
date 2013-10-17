class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= user_session.current_user
  end
  
  def user_session
    @user_session ||= UserSession.new(request)
  end
end
