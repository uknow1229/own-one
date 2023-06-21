class RenameStartTimeColumnToWeights < ActiveRecord::Migration[6.1]
  def change
    rename_column :weights, :date, :start_time
  end
end
