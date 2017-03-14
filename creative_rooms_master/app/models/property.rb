class Property < ApplicationRecord
	belongs_to :user
	has_many :rooms
	has_many :property_images
	validates :postcode, :description, :space_for_artist, :user_id,  presence: true
	validate :must_be_homeowner
	before_create :max_four_featured


	def must_be_homeowner
		if self.user
			errors.add(:base, 'Property owner cannot be an artist') if !self.user.has_role? "Homeowner"
		end
	end
	
	def max_four_featured
		if self.featured
			if Property.where(featured:true).count >= 4
				self.featured = false
			end
		end		
	end


	def primary_property_image
		self.property_images.first.image.url
	end


	private

	def self.featured_properties
		Property.where(featured:true).select(:id, :postcode)
	end

	def self.featured_properties_object
		featured_properties = []
		Property.featured_properties.each do |property|
			featured_properties.push(
				{ property: property,
				  image: property.primary_property_image
				}
			)
		end
		return featured_properties
	end

end