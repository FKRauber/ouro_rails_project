class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end
  def create
    if params[:username].nil? || params[:password].nil?
      redirect_to signin_path, :notice => "A field was left blank, please try again."
    else
      @user = User.find_or_create_by(username: params[:user][:username].downcase)
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path, :notice => "Unable to sign you in, please try again."
      end
    end
  end

  def omniauth
    binding.pry

    @user =  User.find_or_create_with_oa(uid: auth['uid'])
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
