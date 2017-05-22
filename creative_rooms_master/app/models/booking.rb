class Booking < ApplicationRecord
	belongs_to :artist, class_name: 'User', foreign_key: :artist_id
	belongs_to :homeowner, class_name: 'User', foreign_key: :homeowner_id
end
