class ChangeDatetypeBodyWeightOfEndUser < ActiveRecord::Migration[6.1]
  def change
    change_column :end_users, :body_weight, :float
  end
end
