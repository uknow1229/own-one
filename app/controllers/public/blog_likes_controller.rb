class Public::BlogLikesController < ApplicationController
  def create
    @post_blog = PostBlog.find(params[:post_blog_id])
    like = current_end_user.blog_likes.new(post_blog_id: @post_blog.id)
    like.save
    # redirect_to request.referer
  end

  def destroy
    @post_blog = PostBlog.find(params[:post_blog_id])
    like = current_end_user.blog_likes.find_by(post_blog_id: @post_blog.id)
    like.destroy
    # redirect_to request.referer
  end
end
