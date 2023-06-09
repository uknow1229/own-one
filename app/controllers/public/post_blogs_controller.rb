class Public::PostBlogsController < ApplicationController
  def index
    @post_blogs = PostBlog.all
  end

  def show
    @post_blogs = PostBlog.all
    @post_blog = PostBlog.find(params[:id])
  end

  def edit
    @post_blog = PostBlog.find(params[:id])
  end

  def update
    @post_blog = PostBlog.find(params[:id])
    if @post_blog.update(post_blog_params)
      redirect_to post_blogs_path
    else
      render :edit
    end
  end

  def new
    @post_blog = PostBlog.new
  end

  def create
    @post_blog = PostBlog.new(post_blog_params)
    @post_blog.end_user_id = current_end_user.id
    if @post_blog.save
      redirect_to post_blogs_path
    else
      render :new
    end
  end

  def destroy
    @post_blog = PostBlog.find(params[:id])
    @post_blog.destroy
    redirect_to post_blogs_path
    flash[:notice] = "削除が完了しました"
  end

  private

  def post_blog_params
    params.require(:post_blog).permit(:end_user_id, :image, :date, :title, :content)
  end
end
