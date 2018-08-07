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

	# SIN card validation since it has more stringent requirements
	test "user shouldn't have an empty SIN" do
		users(:one).social_insurance_number = nil
		assert_nil users(:one).social_insurance_number
		assert_equal false, users(:one).valid?
	end

	test "user's SIN card number shouldn't pass if not 9 digits" do
		assert_not users(:invalid_SIN).valid?
	end

	test "user shouldn't have an empty hire date" do
		users(:one).hire_date = nil
		assert_nil users(:one).hire_date
		assert_equal false, users(:one).valid?
	end

	# TESTS BELOW DO NOT WORK CORRECTLY
	# Test create method (these tests are unreliable and throwing errors)
	# Need to investigate as functionality works well in rails console
	test "user shouldn't save without necessary info" do
		employee = users(:bad_user)
		user = User.new
		assert_not user.create_user_entry(employee.first_name,
									employee.last_name,
									employee.birthday,
									employee.marital_status,
									employee.social_insurance_number,
									employee.hire_date, employee.preferences)
	end

	test "user should save with all info" do
		user = User.new
		assert user.create_user_entry("bob",
							"brent",
							20180909,
							0,
							000111222,
							20190909, "")
	end

end
