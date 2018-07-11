class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def skycrew_test
    render html: "Skycrew Test Successful."
  end

  private

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in?


end
