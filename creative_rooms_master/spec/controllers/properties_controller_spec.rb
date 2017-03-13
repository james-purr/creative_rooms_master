require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do

	let(:parsed_response) { JSON.parse(response.body) }

	describe "GET #featured" do
    	user = User.create(first_name: 'test', last_name: 'test', email: Faker::Internet.email, password: 'password',  password_confirmation: 'password', role_enum: 0)
		let!(:property) { Property.create(postcode: Faker::Address.zip_code, description: 'test desc', space_for_artist: true, user_id: user.id, featured:true) }
		let!(:image) { PropertyImage.create(property_id: property.id, image: File.new("#{Rails.root}/app/assets/images/property_images/3.jpg")) }

		let!(:property_2) { Property.create(postcode: Faker::Address.zip_code, description: 'test desc', space_for_artist: true, user_id: user.id, featured:false) }

		before :each do
			get :featured
		end
		it 'should return featured properties' do
	  		expect(parsed_response.first["id"].to_i).to eq property.id
	  	end
	end
end
