class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_signed_in?
      !current_user.nil?
    end

    def user_signed_out?
      current_user.nil?
    end

    def sign_in!(user)
      session[:user_id] = user.id
      @current_user = user
    end

    def sign_out!
      @current_user = nil
      session.delete(:user_id)
    end

    def authorize
      redirect_to login_url, alert: 'Please log in to access that.' if user_signed_out?
    end

    helper_method :current_user, :user_signed_in?, :user_signed_out?, :sign_in!, :sign_out!, :authorize
end
