class Room < ApplicationRecord
	belongs_to :property
	has_many :room_images
	validates :description, :bathroom, :property_id,  presence: true
	validate :must_have_three_images

	def must_have_three_images
		errors.add(:base, "Must have at least 3 images") if self.room_images.count < 3
	end
end
