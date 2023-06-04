class CreateWorkoutLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_likes do |t|

      t.timestamps
    end
  end
end
