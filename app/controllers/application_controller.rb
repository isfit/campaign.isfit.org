class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :released?

  def released?
  	release = Time.now > Time.parse('2014-09-31 18:00')

  	if !release
  		render text: 'Coming soon' and return
  	end
  end
end
