class User < ApplicationRecord
	# need these fields for employees 
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :birthday, presence: true
	validates :marital_status, presence: true
	validates :social_insurance_number, presence: true
	validates :hire_date, presence: true

	# create record of new employee
	def create_user_entry(first_name, last_name, birthday, marital_status, social_insurance_number, hire_date)
		u = User.create(first_name: first_name,
						last_name: last_name,
						birthday: birthday,
						marital_status: marital_status,
						social_insurance_number: social_insurance_number,
						hire_date: hire_date)
		u.save # save created user to database
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
	end

	# find all users with a certain last name
	def fetch_users_by_lastname(last_name)
		users = User.find_by(last_name: 'last_name')
	end

	# find all users with a certain birthday
	def fetch_users_by_birthday(birthday)
		users = User.find_by(birthday: 'birthday')
	end

	# find user with a particular SIN
	def fetch_users_by_SIN(social_insurance_number)
		user = User.find_by(social_insurance_number: 'social_insurance_number')
	end

	# find all users with a particular hire date
	def fetch_users_by_hire_date(hire_date)
		user = User.find_by(hire_date: 'hire_date')
	end
end
