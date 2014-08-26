class ContinentsController < ApplicationController
  def index
  end

  def show
  	@continent = Continent.find(params[:id])
  	@stories = @continent.stories.order("created_at DESC").page(params[:page]).per_page(5)
  end

end
