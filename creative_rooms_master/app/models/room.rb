class Room < ApplicationRecord
	belongs_to :property
	has_many :room_images
	validates :description, :property_id,  presence: true


	private

	def self.room_with_image(rooms)
		return_object = {}
		rooms.each do |room|
			return_object[room[0].id] = {
				description: room[0].description,
				image: room[0].room_images.first.image.url,
				owner: room.property.user.full_name
				
			}
		end
		return return_object
	end
end
