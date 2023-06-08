class CreatePostWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :post_workouts do |t|
      t.references :end_user, foreign_key: true, null: false
      t.datetime :date
      t.string :title
      t.integer :site, default: 0
      t.string :time
      t.text :memo         
      t.integer :is_disclosure, default: false

      t.timestamps
    end
  end
end
