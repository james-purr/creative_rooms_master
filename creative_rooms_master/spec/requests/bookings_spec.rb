require "rails_helper"

RSpec.describe "Bookings creation", :type => :request do

	let(:parsed_response) { JSON.parse(response.body) }
	
	artist = (User.with_role :Artist).last
	homeowner = (User.with_role :Homeowner).last
	

	it "creates a Booking with the given params" do
		user = build(:user)
        sign_in user
        room = create(:room)
        count = Booking.count
		params = {startDate: Date.today, endDate: Date.today + 7.days, room: room.id, }
		get "/booking-request", params, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
		expect(Booking.count).to eq(count+1)
		# expect(response).to render_template(:new)

		# post "/widgets", :widget => {:name => "My Widget"}

		# expect(response).to redirect_to(assigns(:widget))
		# follow_redirect!

		# expect(response).to render_template(:show)
		# expect(response.body).to include("Widget was successfully created.")
	end
end