class Score < ActiveRecord::Base
	belongs_to :story

	def self.has_rated story_id, uuid
			Score.where(story_id: story_id, uuid: uuid).exists?
	end


end
