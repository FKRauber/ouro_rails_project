class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end
  def create
    return redirect_to signin_path if !params[:username] || params[:password].empty?
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
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


end
