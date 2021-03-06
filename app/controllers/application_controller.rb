class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :track

  def track
  	session[:uuid] = SecureRandom.uuid if !current_user?
  end

  private
  def current_user?
		! session[:uuid].nil?
	end

	def current_user
		session[:uuid]
	end
end
