class Story < ActiveRecord::Base
	belongs_to :continent
	belongs_to :author_nationality, class_name: "Country"
	belongs_to :happened_in, class_name: "Country"
	has_many :scores
	
	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :story, length: { maximum: 2000 }, presence: true
	validates :title, presence: true
	validates :happened_in, presence: true, allow_blank: false
	validates :continent, presence: true, allow_blank: false


	def calc_rating(story_id)
		self.rating = (Score.includes(:story).where("scores.story_id" => story_id).average(:value).to_f * 10000).to_i
		self.save
	end

	def percent
		return 0 if rating.nil?
		rating/500.0
	end

end