class PropertiesController < ApplicationController
	
	def show
		@properties = Property.all
		render json: @properties
	end
end