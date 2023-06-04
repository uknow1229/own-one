class CreatePostMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :post_meals do |t|

      t.timestamps
    end
  end
end
