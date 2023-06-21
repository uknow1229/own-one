class RemnameDateToStartTimeInPostMeals < ActiveRecord::Migration[6.1]
  def up
    rename_column :post_meals, :date, :start_time
  end

  def down
    rename_column :post_meals, :start_time, :date
  end
end
