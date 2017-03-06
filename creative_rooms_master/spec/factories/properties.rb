FactoryGirl.define do
	user = User.create(first_name: 'test', last_name: 'test', email: 'asdsdg@sdgsdg.com', password: 'password',  password_confirmation: 'password', role_enum: 1)
  factory :property do
    postcode "MyString"
    description "MyString"
    space_for_artist false
    user_id user.id
  end
end
