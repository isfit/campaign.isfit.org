class StoriesController < ApplicationController

	def create

		# Bør gjøres på en bedre måte
		p = story_params
		#p[:happened_in] = Country.find(p[:happened_in].to_i)
		#p[:author_nationality] = Country.find(p[:author_nationality].to_i)
		#p[:continent] = Continent.find(p[:continent].to_i)

		@story = Story.new(p)

		if @story.save
			@newly_created = true
			@score = Score.new
			@has_rated = Score.has_rated(@story.id, current_user)
			render :show
		else
			if @story.continent.blank?
				@story.errors.messages.reject! {|k| k.eql? :continent}
				@story.errors.add(:base, "You must choose continent to share story")
			end
			if @story.continent.blank?
				@story.errors.messages.reject! {|k| k.eql? :happened_in}
				@story.errors.add(:base, "You must choose which country this happened in to share story")
			end
			render :new
		end
	end

	def new
		@story = Story.new
	end

	def rate
		@story = Story.find(params[:id])

		if !Score.has_rated(@story.id, current_user)
			Score.create(story_id: @story.id, value: params[:score][:value], uuid: current_user)

			@story.calc_rating(@story.id)
			redirect_to @story
		end

		

	end


	def show
		binding.pry
		@newly_created = params[:newly_created]
		@story = Story.find(params[:id])
		@score = Score.new
		@has_rated = Score.has_rated(@story.id, current_user)

	end

	def score
		Story.rating(params[:id])
	end

	private
		def story_params
			params.require(:story).permit(:happened_in_id, :story, :author, :author_nationality_id, :email, :continent_id, :title, :solution)
		end

end
