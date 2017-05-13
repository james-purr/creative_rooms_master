class Room < ApplicationRecord
	belongs_to :property
	has_many :room_images
	has_many :ratings
	validates :description, :property_id,  presence: true


	def average_rating
		self.ratings.average(:rating).to_i
	end

	private

	def self.room_with_image(rooms)
		return_object = {}
		rooms.each do |room| 
			return_object[room[0].id] = {
				description: room[0].description,
				image: room[0].room_images.first.image.url,
				owner: room[0].property.user.full_name,
				rating: room.average_rating
				
			}
		end
		return return_object
	end
end
