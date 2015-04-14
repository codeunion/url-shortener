class SessionsController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      sign_in!(@user)
      redirect_to root_url, notice: 'Logged in!'
    else
      ### IS THERE A BETTER WAY TO SHOW A LOGIN ERROR?
      @user = User.new
      @user.errors.add(:base, 'That email and password were not valid! Please try again.')
      render :new
    end
  end

  def update
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private
    def session_params
      # params.require(:session).permit(???)
    end
end
