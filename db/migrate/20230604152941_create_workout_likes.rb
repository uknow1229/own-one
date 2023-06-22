class CreateWorkoutLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_likes do |t|
      t.bigint :end_user_id, null: false
      t.references :post_workout, type: :integer, foreign_key: true, null: false

      t.timestamps

      add_foreign_key :workout_likes, :end_users
    end
  end
end
