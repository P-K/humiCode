class User < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :birthday, presence: true
	validates :marital_status, presence: true
	validates :social_insurance_number, presence: true
	validates :hire_date, presence: true
	
end
