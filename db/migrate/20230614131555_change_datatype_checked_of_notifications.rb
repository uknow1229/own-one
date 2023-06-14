class ChangeDatatypeCheckedOfNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column :notifications, :checked, :boolean
    change_column_default :notifications, :checked, false
    change_column_null :notifications, :checked, false
  end
end
