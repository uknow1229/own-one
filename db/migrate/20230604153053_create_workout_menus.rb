class CreateWorkoutMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_menus do |t|
      t.references :post_workout, type: :bigint, foreign_key: true
      t.string :title
      t.float :weight
      t.integer :reptition_count
      t.integer :set_count

      t.timestamps
    end
  end
end
