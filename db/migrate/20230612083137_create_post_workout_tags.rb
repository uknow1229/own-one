class CreatePostWorkoutTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_workout_tags do |t|
      t.integer :post_workout_id
      t.integer :workout_tag_id

      t.timestamps
    end
    add_index :post_workout_tags, :post_workout_id
    add_index :post_workout_tags, :workout_tag_id
    add_index :post_workout_tags, [:post_workout_id,:workout_tag_id],unique: true
  end
end
