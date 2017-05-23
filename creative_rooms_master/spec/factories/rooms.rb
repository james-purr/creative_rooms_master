FactoryGirl.define do
	random_email = (0...8).map { (65 + rand(26)).chr }.join

	user = User.create(first_name: 'test', last_name: 'test', email: "#{random_email}@email.com", password: 'password',  password_confirmation: 'password', role_enum: 0)  
	property = Property.create(postcode: "MyString", description: "MyString", space_for_artist: true, user_id: user.id)

	factory :room do
		description "MyString"
		bathroom false
    	property_id property.id
  	end
end
