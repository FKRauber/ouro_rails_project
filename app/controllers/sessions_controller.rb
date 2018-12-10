class SessionsController < ApplicationController
  def new
  end
  def create
  	return redirect_to(controller: 'sessions', action: 'new') if !params[:username] || params[:username].empty?
  	session[:username] = params[:username]
  	redirect_to controller: 'static_pages', action: 'home'
  end

  def destroy
  	session.delete :username
  	redirect_to controller: 'static_pages', action: 'home'
  end
end
