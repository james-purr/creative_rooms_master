class Room < ApplicationRecord
	belongs_to :property
	has_many :room_images
	has_many :ratings
	validates :description, :property_id,  presence: true


	def average_rating
		self.ratings.average(:rating).to_i
	end

	def room_info
		return_object = {}
		return_object[:id] = self.id
		return_object[:room_description] = self.description
		return_object[:property_description] = self.property.description
		return_object[:images] = self.room_images.map(&:image).map(&:url)
		return_object[:location] = self.property.search_data[:location]
		return_object[:postcode] = self.property.postcode
		return_object[:owner] = self.property.user.full_name
		return_object[:owner_interests] = {}
		self.property.user.arts_interest.each_with_index do |interest, index|
			return_object[:owner_interests][index] = interest
		end

		
		return_object[:purpose] = self.property.user.purpose
		return_object
	end

	private

	def self.room_with_image(rooms)
		return_object = {}
		rooms.each do |room| 
			return_object[room[0].id] = {
				id: room[0].property.id,
				description: room[0].description,
				postcode: room[0].property.postcode,
				image: room[0].room_images.first.image.url,
				owner: room[0].property.user.full_name,
				rating: (1..room[0].average_rating).to_a,
				remaining_rating: (room[0].average_rating+1..5).to_a,
				position:  [room[0].property.latitude, room[0].property.longitude]				
			}
		end
		return return_object
	end
end
