class CreatePostWorkoutTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_workout_tags do |t|
      t.references :post_workout, type: :bigint, null: false, foreign_key: true
      t.references :workout_tag, type: :bigint, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_workout_tags, [:post_workout_id,:workout_tag_id],unique: true
  end
end
