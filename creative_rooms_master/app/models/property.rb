class Property < ApplicationRecord
	belongs_to :user
	has_many :rooms
	has_many :property_images
	validates :postcode, :description, :space_for_artist, :user_id,  presence: true
	validate :must_be_homeowner


	def must_be_homeowner
		if self.user
			errors.add(:base, 'Property owner cannot be an artist') if !self.user.has_role? "Homeowner"
		end
	end



end