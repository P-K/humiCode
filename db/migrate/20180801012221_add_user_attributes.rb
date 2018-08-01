class AddUserAttributes < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :first_name, :varchar
  	add_column :users, :last_name, :varchar
  	add_column :users, :birthday, :date
  	add_column :users, :marital_status, :integer
  	add_column :users, :social_insurance_number, :integer
  	add_column :users, :hire_date, :date
  	add_column :users, :preferences, :text
  end
end
