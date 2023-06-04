class CreateMealLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_likes do |t|

      t.timestamps
    end
  end
end
