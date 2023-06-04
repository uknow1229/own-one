class CreatePostWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :post_workouts do |t|

      t.timestamps
    end
  end
end
