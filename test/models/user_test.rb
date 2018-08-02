require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
	# Testing validation 
	test "user shouldn't have an empty first name" do
		users(:one).first_name = nil
		assert_nil users(:one).first_name
		assert_equal false, users(:one).valid?
	end

	test "user shouldn't have an empty last name" do
		users(:one).last_name = nil
		assert_nil users(:one).last_name
		assert_equal false, users(:one).valid?
	end

	test "user shouldn't have an empty date of birth" do
		users(:one).birthday = nil
		assert_nil users(:one).birthday
		assert_equal false, users(:one).valid?
	end

	test "user shouldn't have an empty marital status" do
		users(:one).marital_status = nil
		assert_nil users(:one).marital_status
		assert_equal false, users(:one).valid?
	end

	test "user shouldn't have an empty SIN" do
		users(:one).social_insurance_number = nil
		assert_nil users(:one).social_insurance_number
		assert_equal false, users(:one).valid?
	end

	test "user shouldn't have an empty hire date" do
		users(:one).hire_date = nil
		assert_nil users(:one).hire_date
		assert_equal false, users(:one).valid?
	end

	# Test create method
	test "user shouldn't save without necessary info" do
		employee = users(:bad_user)
		user = User.new
		assert_not user.create_user_entry(employee.first_name,
									employee.last_name,
									employee.birthday,
									employee.marital_status,
									employee.social_insurance_number,
									employee.hire_date)
	end

	test "user should save without all info" do
		employee = users(:two)
		user = User.new
		assert user.create_user_entry(employee.first_name,
									employee.last_name,
									employee.birthday,
									employee.marital_status,
									employee.social_insurance_number,
									employee.hire_date)
	end

end
