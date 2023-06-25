class RemoveLastNameFromEndUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :end_users, :last_name, :string
  end
end
