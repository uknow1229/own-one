class CreateWorkoutLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_likes do |t|
      t.references :end_user, type: :integer, foreign_key: true, null: false
      t.references :post_workout, type: :integer, foreign_key: true, null: false

      t.timestamps
    end
  end
end
