class SessionsController < ApplicationController
  def new
  end
  def create
  	return redirect_to(controller: 'sessions', action: 'new') if !params[:username] || params[:username].empty?
  	session[:username] = params[:username]
  	redirect_to controller: 'application', action: 'hello'
  end

  def destroy
  	session.delete :name
  	redirect_to controller: 'application', action: 'hello'
  end
end
