require 'rails_helper'

RSpec.describe "roles" do

    it 'should not validate user creation without role' do
        user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
        expect(user).to_not be_valid  
    end

    it 'should convert role enum to string' do
        user = build(:user)
        expect(user.role_enum).to eq('Homeowner')  
    end

    it 'should not accept invalid enum roles' do
    	expect{ User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password', role_enum: 2)}.to raise_error	
    end

    it 'should automatically create a role based on role enum' do
    	user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password', role_enum: 0)
		expect(user.has_role? "Homeowner").to eq(true)	
    end



end