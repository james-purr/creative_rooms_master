class PropertiesController < ApplicationController
	
	def show
		@properties = Property.all
		render json: @properties
	end

	def featured
		@featured_properties = []
		featured_properties = Property.where(featured:true).select(:id, :postcode)
		featured_properties.each do |property|
			@featured_properties.push(
				{ property: property,
				  image: property.primary_property_image
				}
			)
		end
		render json: @featured_properties
	end
end