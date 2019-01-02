class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end
  def create
    if !params[:username].nil? || !params[:password].nil?
      redirect_to signin_path
    else
      @user = User.find_or_create_by(username: params[:user][:username]) || User.find_or_create_from_auth_hash(auth)
      if @user && (@user.authenticate(params[:user][:password]) || User.authenticate(auth_hash))
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end

  def destroy
  	session.clear
  	redirect_to root_url
  end

  private

  def auth
    request.env('omniauth.auth')
  end


end
