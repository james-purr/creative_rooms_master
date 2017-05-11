class Room < ApplicationRecord
	belongs_to :property
	has_many :room_images
	validates :description, :bathroom, :property_id,  presence: true

end
