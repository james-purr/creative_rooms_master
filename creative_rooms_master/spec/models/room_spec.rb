require 'rails_helper'


def build_property
  	user = User.create(first_name: 'test', last_name: 'test', email: Faker::Internet.email, password: 'password',  password_confirmation: 'password', role_enum: 0)
	property = Property.create(postcode: Faker::Address.zip_code, description: 'test desc', space_for_artist: true, user_id: user.id)
  	2.times do
  		pi = build(:property_image)
  		property.property_images << pi
  	end
	return property
end

RSpec.describe Room, type: :model do
  it 'should validate all attributes' do
	room = Room.create()
	expect(room).to_not be_valid  
  end
  
  it 'should belong to a Property' do
  	r = Room.reflect_on_association(:property)
  	r.macro.should == :belongs_to
  end
  
  it 'should have many images' do
  	r = Room.reflect_on_association(:room_images)
  	r.macro.should == :has_many
  end

  it 'should validate how many images are attached' do
  	property = build_property	
	room = Room.create(description: 'test desc', bathroom: true, property_id: property.id)
  	2.times do
  		ri = build(:room_image)
  		room.room_images << ri
  	end

    expect(room).to_not be_valid    	
  end

end