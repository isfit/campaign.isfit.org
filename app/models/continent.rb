class Continent < ActiveRecord::Base
	has_many :stories

	def stories_sorted sort_string
		stories = self.stories


		if sort_string.eql?("ASC")
      stories = stories.order("created_at ASC")
    elsif sort_string.eql?("DESC")
    	stories = stories.order("created_at DESC")
    elsif sort_string.eql?("HIGH")
    	stories = stories.order("rating DESC")
    elsif sort_string.eql?("LOW")
    	stories = stories.order("rating ASC")
    end
    stories
	end

  def self.continents_collected
	  Continent.all.collect {|a| [a.name.capitalize, a.id] }
	end

end
