class Shop < ApplicationRecord
	include BCrypt
	has_secure_password
	
  	has_many :authentications, dependent: :destroy
  	def full_street_address
 		[address,postcode,city,state].compact.join(',')
	end

	geocoded_by :full_street_address
	after_validation :geocode
end
