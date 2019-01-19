class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end
  def create
    if params[:username].nil? || params[:password].nil? || params[:email].nil?
      redirect_to signin_path
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path, :notice => "Unable to sign you in, please try again."
      end
    end
  end

  def omniauth
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_oa(auth_hash)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed In!"
    else
      redirect_to root_url
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
