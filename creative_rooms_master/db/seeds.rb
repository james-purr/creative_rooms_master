# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'ffaker'

User.delete_all

20.times do
	User.create(first_name: FFaker::Name.first_name, 
				last_name: FFaker::Name.last_name, 
				email: FFaker::Internet.email, 
				password: 'password', 
				password_confirmation: 'password', 
				role_enum:0
	)
end

property_owners = User.where(role_enum: 0);

postcode_array = [
'E17 6AY',
'E17 7NW',
'E17 8PF',
'E17 9HZ',
'E17 5NS',
'E17 5RR',
'E17 8HP',
'E17 9QH',
'E17 3QW',
'E17 8PY',
'E17 3DX',
'E17 5RA',
'E17 3PH',
'E17 3SR',
'E17 6EF',
'E17 3RQ',
'E17 5NP',
'E17 6QW',
'E17 9BL',
'E17 8NN',
'E17 5LE',
'E17 8LT',
'E17 6RN',
'E17 5DZ',
'E17 8PQ',
'E17 8AY',
'E17 3HA',
'E17 6LB',
'E17 6EJ',
'E17 7QD',
'E17 5DZ',
'E17 4RQ',
'E17 9QQ',
'E17 4LE',
'E17 9JY',
'E17 5NZ',
'E17 6QS',
'E17 5AZ',
'E17 3BB',
'E17 8LW',
'E17 4RX',
'E17 3LN',
'E17 4NS',
'E17 3HQ',
'E17 4LP',
'E17 5PE',
'E17 8LW',
'E17 8HH'
]

Property.delete_all
(0..37).each do |number|
	property = Property.create(postcode: postcode_array.sample, description: FFaker::Lorem.paragraph, space_for_artist: [true, false].sample, user_id: property_owners.sample.id)
	pi = PropertyImage.create(property_id: property.id, image: File.new("#{Rails.root}/app/assets/images/property_images/#{number}.jpg"))
end

room_image_array = (1..19).to_a
Room.delete_all
Property.all.each do |property|
	puts "property is #{property.id}"
	room = Room.create(property_id: property.id, description: FFaker::Lorem.paragraph, bathroom: [true, false].shuffle[0])
	puts "room with id #{room.id} created with property id od #{property.id}"
	3.times do
		image = RoomImage.create(image: File.new("#{Rails.root}/app/assets/images/room_images/#{room_image_array.shuffle[0]}.jpg"), room_id: room.id)
	end
end

Rating.delete_all

Room.all.each do |room|
	10.times do
		Rating.create(rating: (1..5).to_a.sample, room_id: room.id)
	end
end




