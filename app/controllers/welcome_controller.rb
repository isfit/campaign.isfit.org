class WelcomeController < ApplicationController
  layout 'frontpage', only: [:index]
  def index
  end

  def info
  end
end
