class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    # check to make sure the user is real and that they have editing permissions (1)
  	unless User.find_by_id(session[:user_id] && session[:user_role] === 1)
  		flash[:notice] = "Please Log In"
  		session[:request_uri] = request.url
  		redirect_to "/login"
  	end
  end

  helper_method :current_user

end
