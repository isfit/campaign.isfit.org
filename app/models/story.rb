class Continent < ActiveRecord::Base
	belongs_to :continent
	belongs_to :author_nationality, class_name: "Country"
	belongs_to :happened_in, class_name: "Country"
	  
	validates :story, length: { maximum: 2000 }
end