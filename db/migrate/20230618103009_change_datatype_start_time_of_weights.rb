class ChangeDatatypeStartTimeOfWeights < ActiveRecord::Migration[6.1]
  def change
    change_column :weights, :start_time, :datetime
  end
end
