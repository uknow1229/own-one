class CreateBlogLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_likes do |t|

      t.timestamps
    end
  end
end
