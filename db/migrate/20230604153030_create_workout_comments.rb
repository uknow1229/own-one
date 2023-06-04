class CreateWorkoutComments < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_comments do |t|

      t.timestamps
    end
  end
end
