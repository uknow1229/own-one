class RemnamedateTostartTimeInPostWorkouts < ActiveRecord::Migration[6.1]
  def up
    rename_column :post_workouts, :date, :start_time
  end

  def down
    rename_column :post_workouts, :start_time, :date
  end
end
