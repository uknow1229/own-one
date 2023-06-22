class CreateMealMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_menus do |t|
      t.references :post_meal, type: :bigint, null: false, foreign_key: true
      t.string :title
      t.string :quantity
      t.integer :calorie

      t.timestamps
    end
  end
end
