class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def skycrew_test
    render html: "Skycrew Test Successful."
  end

end
