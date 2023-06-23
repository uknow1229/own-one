class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :subject, type: :bigint, polymorphic: true
      t.references :end_user, type: :bigint, foreign_key: true
      t.integer :action_type, null: false

      t.timestamps
    end
  end
end
