class ApplicationController < ActionController::Base
  before_action :logged_in_user, only: %i[index edit update]

  protect_from_forgery with: :exception
  include SessionsHelper

  def skycrew_test
    render html: "Skycrew Test Successful."
  end

  private

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :error => "Record not found." }
  end

  helper_method :logged_in?

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
