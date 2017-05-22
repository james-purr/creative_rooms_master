class BookingsController < ApplicationController

	def booking_request
		startDate = Date.parse(params["startDate"])
		endDate = Date.parse(params["endDate"])
		room = Room.find(params["room"])
		@booking = Booking.create(start_date: startDate, end_date: endDate, artist_id: current_user.id, homeowner_id: room.property.user.id, room_id: room.id)
		render json: @booking
	end
end