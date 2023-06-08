class CreatePostMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :post_meals do |t|
      t.references :end_user, foreign_key: true, null: false
      t.datetime :date
      t.integer :timing, default: 0
      t.integer :meal_type,   default: 0         
      t.text :memo
      t.boolean:is_closed,    default: false

      t.timestamps
    end
  end
end
