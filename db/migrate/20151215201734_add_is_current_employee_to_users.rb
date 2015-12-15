class AddIsCurrentEmployeeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :not_current_employee, :boolean, null: false, default: false
  end
end
