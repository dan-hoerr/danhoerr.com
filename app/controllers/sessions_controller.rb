
class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_role] = user.role
      unless session[:request_uri].nil?
        redirect_to session[:request_uri]
      else
        redirect_to root_url
      end
    else
      flash.now.alert = "Invalid login"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_role] = nil
    redirect_to root_url, :notice => "Logged Out!"
  end
end
