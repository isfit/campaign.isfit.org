class Continent < ActiveRecord::Base
	belongs_to :continent
	belongs_to :country
	belongs_to :happened_in, class_name: "Country"
	  
	validates :story, length: { maximum: 2000 }
end