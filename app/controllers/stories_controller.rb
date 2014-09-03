class StoriesController < ApplicationController

	def create

		# Bør gjøres på en bedre måte
		p = story_params
		p[:happened_in] = Country.find(p[:happened_in].to_i)
		p[:author_nationality] = Country.find(p[:author_nationality].to_i)
		p[:continent] = Continent.find(p[:continent].to_i)

		@story = Story.new(p)

		@story.save
		redirect_to root_path
	end


	def show
		@story = Story.find(params[:id])
	end

	def score
		Story.rating(params[:id])
	end

	private
		def story_params
			params.require(:story).permit(:happened_in, :story, :author, :author_nationality, :email, :continent)
		end

end
