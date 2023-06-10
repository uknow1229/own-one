class Public::BlogCommentsController < ApplicationController
  def create
    @post_blog = PostBlog.find(params[:post_blog_id])
    @comment = current_end_user.blog_comments.new(blog_comment_params)
    @comment.post_blog_id = @post_blog.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render :post_comments
    else
      render 'post_blogs/show'
    end
  end

  def destroy
    BlogComment.find(params[:id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    @post_blog = PostBlog.find(params[:post_blog_id]) 
    render :post_comments
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
