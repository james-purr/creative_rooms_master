class PropertiesController < ApplicationController
	
	def show
		@properties = Property.all
		render json: @properties
	end

	def featured
		@properties = Property.where(featured:true)
		render json: @properties
	end
end