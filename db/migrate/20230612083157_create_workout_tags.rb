class CreateWorkoutTags < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_tags do |t|
      t.string :name

      t.timestamps
    end
    add_index :workout_tags, :name, unique:true
  end
end
