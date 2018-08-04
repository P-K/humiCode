class AddRoleColumns < ActiveRecord::Migration[5.2]
  def change
  	add_column :roles, :name, :varchar
  	add_column :roles, :editCompensation, :boolean, :default => false
  	add_column :roles, :accessRecords, :boolean, :default => false
  end
end
