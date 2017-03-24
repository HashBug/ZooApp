class Zoo < ApplicationRecord
	#associations
	has_many :animals

	#validations
	validates :name, presence: true
	validates :city, presence: true
	validates :zipcode, presence: true

end
