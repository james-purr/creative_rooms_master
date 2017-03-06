require 'rails_helper'

RSpec.describe User, type: :model do
    it "doesn't create a user if validation fails" do
        user = User.create(email: 'test@test.com')   
        expect(user).to_not be_valid       
    end

    it 'should not allow a user to be created without a first and last name' do
    	user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    	expect(user).to_not be_valid   
    end

    it 'should not allow a user to be created without a role enum' do
    	user = User.create(first_name: 'james', last_name: 'Bennett', email: 'test@test.com', password: 'password', password_confirmation: 'password')
		user.add_role :admin
    	expect(user).to_not be_valid      	
    end


end
