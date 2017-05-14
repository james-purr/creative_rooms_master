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
		@search_return = Room.room_with_image(search_results)
 		@search_coordinates = calculate_average_position(@search_return)
		render json: [@search_return, @search_coordinates]
	end

	def geo_search_results
		search_results = Property.where("longitude > ?", params[:west].to_f).where("longitude < ?", params[:east].to_f).where("latitude > ?", params[:south].to_f).where("latitude < ?", params[:north].to_f).select(:id, :latitude, :longitude, :user_id, :postcode).map(&:rooms)
		@search_return = Room.room_with_image(search_results)
		lat = (params[:south].to_f + params[:north].to_f) / 2
		lng = (params[:east].to_f + params[:west].to_f) / 2
 		@search_coordinates = [lat, lng]
		render json: [@search_return, @search_coordinates]

	end
end