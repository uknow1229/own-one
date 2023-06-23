class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.float :value
      t.date :date
      t.references :end_user, type: :bigint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
