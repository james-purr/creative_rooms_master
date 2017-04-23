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
		binding.pry
	end
end