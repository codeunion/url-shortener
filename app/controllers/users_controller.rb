class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.user_id
      redirect_to root_path, notice: "You are signed up!"
    else
      render :new
    end
  end
end