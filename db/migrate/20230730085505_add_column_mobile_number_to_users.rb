class AddColumnMobileNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mobile_no, :integer
  end
end
