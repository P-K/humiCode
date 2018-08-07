class Role < ApplicationRecord

	has_many :users
	validates :id, presence: true, :uniqueness => true

	# get role name based on roleID (from user probably)
	def find_role_name(roleID)
		role = Role.find(roleID)
		return role.name
	end

	# methods to check permission flags

	def can_edit_compensation(roleID)
		role = Role.find(roleID)
		return role.editCompensation
	end

	def can_access_records(roleID)
		role = Role.find(roleID)
		return role.accessRecords
	end


end
