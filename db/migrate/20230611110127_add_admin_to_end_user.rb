class AddAdminToEndUser < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :admin, :boolean, default: false
  end
end
