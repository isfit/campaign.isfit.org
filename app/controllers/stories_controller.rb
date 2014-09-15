class StoriesController < ApplicationController

	def create

		# Bør gjøres på en bedre måte
		p = story_params
		#p[:happened_in] = Country.find(p[:happened_in].to_i)
		#p[:author_nationality] = Country.find(p[:author_nationality].to_i)
		#p[:continent] = Continent.find(p[:continent].to_i)

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
		binding.pry
		if Score.has_rated(@story.id, current_user)
			Score.create(story_id: @story.id, value: params[:score][:value], uuid: current_user)

			@story.calc_rating(@story.id)
			redirect_to @story
		end
		

	end


	def show
		@story = Story.find(params[:id])
		@score = Score.new
		@has_rated = Score.has_rated(@story.id, current_user)

	end

	def score
		Story.rating(params[:id])
	end

	private
		def story_params
			params.require(:story).permit(:happened_in_id, :story, :author, :author_nationality_id, :email, :continent_id, :title)
		end

end
