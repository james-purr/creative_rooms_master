require "rails_helper"

RSpec.describe "Bookings creation", :type => :request do

	# put the returned JSON response into a variable
	let(:parsed_response) { JSON.parse(response.body) }
	
	#get artist and homeowner for the booking params
	artist = (User.with_role :Artist).last
	homeowner = (User.with_role :Homeowner).last
	
	# get current user for the controller
	user = build(:user)
    sign_in user	

	it "creates a Booking with the given params" do
        room = create(:room)
        count = Booking.count
		params = {startDate: Date.today, endDate: Date.today + 7.days, room: room.id, }
		get "/booking-request", params, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
		expect(Booking.count).to eq(count+1)
	end
end