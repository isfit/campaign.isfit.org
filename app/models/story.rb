class Continent < ActiveRecord::Base
	belongs_to :continent
	belongs_to :country
	  
	validates :story, length: { maximum: 2000 }
end