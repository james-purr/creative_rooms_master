class User < ApplicationRecord
	rolify

	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	validates :first_name, :last_name, :role_enum,  presence: true

	before_create :set_role
	serialize :arts_interest
	enum role_enum: ['Homeowner', 'Artist']

	# takes the role enum attribute (that restricts the roles you can choose) and creates a role object based on that

	def set_role
		self.add_role self.role_enum
	end

	def full_name
		self.first_name + " " + self.last_name
	end

end