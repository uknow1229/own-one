class AddVisitorIdToNotifications < ActiveRecord::Migration[6.1]
  def up
    add_column :notifications, :visitor_id, :integer
    add_column :notifications, :visited_id, :integer
  end

  def down
    add_column :notifications, :visitor_id, :integer, null: false
    add_column :notifications, :visited_id, :integer, null: false
  end
end
