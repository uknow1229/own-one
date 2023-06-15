class AddCheckedToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :checked, :boolean
  end
end
