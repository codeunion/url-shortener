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
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      ### Likely not best implementation
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
