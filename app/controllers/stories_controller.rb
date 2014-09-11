class StoriesController < ApplicationController

	def create

		# Bør gjøres på en bedre måte
		p = story_params
		p[:happened_in] = Country.find(p[:happened_in].to_i)
		p[:author_nationality] = Country.find(p[:author_nationality].to_i)
		p[:continent] = Continent.find(p[:continent].to_i)

		@story = Story.new(p)

		if @story.save
			redirect_to @story
		else
			render :new
		end
	end

	def new
		@story = Story.new
	end

	def rate
		@story = Story.find(params[:id])
		Score.create(story_id: @story.id, value: params[:score][:value], uuid: current_user)
		@story.calc_rating(@story.id)

		redirect_to @story
	end


	def show
		@story = Story.find(params[:id])
		@score = Score.new
	end

	def score
		Story.rating(params[:id])
	end

	private
		def story_params
			params.require(:story).permit(:happened_in, :story, :author, :author_nationality, :email, :continent, :title)
		end

end
