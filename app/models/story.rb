class Story < ActiveRecord::Base
	belongs_to :continent
	belongs_to :author_nationality, class_name: "Country"
	belongs_to :happened_in, class_name: "Country"
	
	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :story, length: { maximum: 2000 }
end