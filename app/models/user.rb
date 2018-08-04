class User < ApplicationRecord
	# need these fields for employees 
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :birthday, presence: true
	validates :marital_status, presence: true
	# Could add line for enumerating marital status (corresponds to 0, 1, 2, 3):
	# enum marital_status: [:unmarried, :married, :divorced, :separated]

	# Each employee will have a unique, 9 digit social insurance number
	validates :social_insurance_number, :presence => true, :uniqueness => true, :format => {with: /[0-9]{9}/}
	validates :hire_date, presence: true

	# create record of new employee
	def create_user_entry(first_name, last_name, birthday, marital_status, social_insurance_number, hire_date, preferences)

		self.first_name = first_name
		self.last_name = last_name
		self.birthday = birthday
		self.marital_status = marital_status
		self.social_insurance_number = social_insurance_number
		self.hire_date = hire_date
		self.preferences = preferences

		# check is the object is valid per defined validation rules
		if self.valid? then
			self.save
		end
	end

	### Read Methods ###

	# read all employee records from db
	def fetch_all_users()
		users = User.all
		return users
	end

	# find all users with a certain first name
	def fetch_users_by_firstname(first_name)
		users = User.find_by(first_name: 'first_name')
		return users
	end

	# find all users with a certain last name
	def fetch_users_by_lastname(last_name)
		users = User.find_by(last_name: 'last_name')
		return users
	end

	# find all users with a certain birthday
	def fetch_users_by_birthday(birthday)
		users = User.find_by(birthday: 'birthday')
		return users
	end

	# find user with a particular SIN
	def fetch_users_by_SIN(social_insurance_number)
		user = User.find_by(social_insurance_number: 'social_insurance_number')
		return user
	end

	# find all users with a particular hire date
	def fetch_users_by_hire_date(hire_date)
		user = User.find_by(hire_date: 'hire_date')
		return user
	end
end
