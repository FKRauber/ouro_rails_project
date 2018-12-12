class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end
  def create
    redirect_to signin_path if !params[:username] || params[:password].empty?
    @user = User.find_by(username: params[:user][:username]) || User.find_or_create_from_auth_hash(auth_hash)
    if @user && (@user.authenticate(params[:user][:password]) || User.authenticate(auth_hash))
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
  	session.clear
  	redirect_to root_url
  end

  private

  def auth_hash
    request.env('omniauth.auth')
  end


end
