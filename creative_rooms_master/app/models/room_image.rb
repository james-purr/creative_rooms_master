class RoomImage < ApplicationRecord
	belongs_to :room
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	validates_attachment :image, presence: true,
  		content_type: { content_type: ['image/png', 'image/jpeg'] },
		size: { in: 0..10.megabytes }
end
