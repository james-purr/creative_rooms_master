class RoomsController < ApplicationController

	def room_info
		@room = Room.find(params[:id]).room_info
		render json: @room
	end
end