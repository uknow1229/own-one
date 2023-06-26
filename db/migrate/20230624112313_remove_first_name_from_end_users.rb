class RemoveFirstNameFromEndUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :end_users, :first_name, :string
  end
end
