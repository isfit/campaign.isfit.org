class ContinentsController < ApplicationController
  def index
  end

  def show

  	#binding.pry
  	@continent = Continent.find(params[:id])

  	if params[:sort]
  		stories = @continent.stories_sorted(params[:sort])
  	else
  		stories = @continent.stories_sorted("HIGH")
  	end
  	@stories = stories.page(params[:page]).per_page(5)
  end

end
