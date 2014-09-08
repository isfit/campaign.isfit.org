class Continent < ActiveRecord::Base
	has_many :stories

	def stories_sorted sort_string
		stories = self.stories


		if sort_string.eql?("ASC")
      stories = stories.order("created_at ASC")
    elsif sort_string.eql?("DESC")
    	stories = stories.order("created_at DESC")
    end
    stories
	end

  def self.continents_collected
	  Continent.all.collect {|a| [a.name, a.id] }
	end

end
