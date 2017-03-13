require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do

	let(:parsed_response) { response.body.to_json }
	
	describe "GET #featured" do
		let!(:property) { Property.create(postcode: Faker::Address.zip_code, description: 'test desc', space_for_artist: true, user_id: user.id, featured:true) }
		let!(:property_2) { Property.create(postcode: Faker::Address.zip_code, description: 'test desc', space_for_artist: true, user_id: user.id, featured:false) }

		before :each do
			get :featured
		end
	  expect(parsed_response.first["id"].to_i).to eq property.id
	end
end
