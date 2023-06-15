class RenameVisitorIdColumnToNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column_null :notifications, :visitor_id, true
    change_column_null :notifications, :visited_id, true
  end
end
