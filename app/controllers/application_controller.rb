class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_user
  # before_action :authorize
  before_filter :authorize, :only => :edit

  helper_method :current_user
 

#memoization
  def current_user
  	@current_user ||= User.where(id: session[:user_id]).first
  end

  def setup_user
  	@user = User.new
  end

#Make two partials, one with the link, one without.

# if someone is logged in, use partial with links, else use partial without links.
def authorize
    
 redirect_to new_sessions_path if current_user.nil?
end


end
