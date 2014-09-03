class Story < ActiveRecord::Base
	belongs_to :continent
	belongs_to :author_nationality, class_name: "Country"
	belongs_to :happened_in, class_name: "Country"
	has_many :scores
	
	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :story, length: { maximum: 2000 }


	def self.rating(story_id)
		s = Story.find(story_id)
		s.rating = (Score.includes(:story).where("scores.story_id" => story_id).average(:value).to_f * 10000).to_i
		s.save
	end

end