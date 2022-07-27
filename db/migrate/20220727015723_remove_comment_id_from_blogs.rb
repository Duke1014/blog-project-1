class RemoveCommentIdFromBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :comment_id, :integer
  end
end
