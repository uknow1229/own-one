class CreateMealLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_likes do |t|
      t.references :end_user, foreign_key: true, null: false
      t.references :post_meal, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
