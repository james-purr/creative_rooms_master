class User < ApplicationRecord
	rolify

	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	validates :first_name, :last_name, :role_enum,  presence: true

	before_create :set_role

	enum role_enum: ['Homeowner', 'Artist']

	# takes the role enum attribute (that restricts the roles you can choose) and creates a role object based on that

	def set_role
		self.add_role self.role_enum
	end

end