class RenameDateToStartTimeInPostBlogs < ActiveRecord::Migration[6.1]
  def up
    rename_column :post_blogs, :date, :start_time
  end

  def down
    rename_column :post_blogs, :start_time, :date
  end
end
