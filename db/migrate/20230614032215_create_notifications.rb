class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :subject, type: :integer, polymorphic: true
      t.references :end_user, type: :integer, foreign_key: true
      t.integer :action_type, null: false

      t.timestamps
    end
  end
end
