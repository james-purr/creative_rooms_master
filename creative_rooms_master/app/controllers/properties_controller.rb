class PropertiesController < ApplicationController
	
	def show
		@properties = Property.all
		render json: @properties
	end

	def featured
		@featured_properties = Property.featured_properties_object
		render json: @featured_properties
	end

	def search_results
		search_results = Property.near(params["search_term"]).select(:id).map(&:rooms)
		@search_coordinates = Geocoder.coordinates(params["search_term"])
		@search_return = Room.room_with_image(search_results)
		render json: [@search_return, @search_coordinates]
	end
end