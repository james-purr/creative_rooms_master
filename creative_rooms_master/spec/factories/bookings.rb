FactoryGirl.define do
  factory :booking do
    start_date "MyString"
    end_date "MyString"
    artist_id 1
    homeowner_id 1
    confirmed false
  end
end
