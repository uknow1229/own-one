class Public::BlogCommentsController < ApplicationController
  def create
    post_blog = PostBlog.find(params[:post_blog_id])
    comment = current_end_user.blog_comments.new(blog_comment_params)
    comment.post_blog_id = post_blog.id
    comment.save
    redirect_to post_blog_path(post_blog)
  end

  def destroy
    BlogComment.find(params[:id]).destroy
    redirect_to post_blog_path(params[:post_blog_id])
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
