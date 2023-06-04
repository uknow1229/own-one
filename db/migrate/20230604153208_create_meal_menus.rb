class CreateMealMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_menus do |t|

      t.timestamps
    end
  end
end
