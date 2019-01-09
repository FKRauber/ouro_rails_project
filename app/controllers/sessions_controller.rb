class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end
  def create
    if params[:username].nil? || params[:password].nil?
      redirect_to signin_path
    else
      @user = User.find_or_create_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end

  def omniauth
    @user =  User.find_or_create_with_omniauth(auth)
    if @user
      session[:user_id] = @user.id 
      redirect_to user_path(@user), :notice => "Signed In!"
    else
      redirect_to signin_path, :notice => "Unable to sign you in, please try again."
    end
  end

  def destroy
  	session.clear
  	redirect_to root_url, :notice => "Signed Out!"
  end

  private

  def auth
    request.env["omniauth.auth"]
  end


end
