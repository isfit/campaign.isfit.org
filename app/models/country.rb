class Country < ActiveRecord::Base
  def self.countries_collected
	  Country.all.collect {|a| [a.name, a.id] }
	end
end
