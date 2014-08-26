class Country < ActiveRecord::Base
	self.primary_key = :id

  def self.countries_collected
	  Country.all.collect {|a| [a.name, a.id] }
	end
end
