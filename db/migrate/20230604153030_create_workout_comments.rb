class CreateWorkoutComments < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_comments do |t|
      t.references :end_user, type: :bigint, null: false, foreign_key: true
      t.references :post_workout, type: :bigint, null: false, foreign_key: true
      t.text :comment,    null: false

      t.timestamps
    end
  end
end
