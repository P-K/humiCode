class CorrectSiNtype < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :social_insurance_number, :integer
  end
end
