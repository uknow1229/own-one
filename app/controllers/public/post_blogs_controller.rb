class Public::PostBlogsController < ApplicationController
  def index
    @post_blogs = PostBlog.all.page(params[:page]).per(9)
    @tag_list = BlogTag.all
  end

  def show
    @post_blogs = PostBlog.all
    @post_blog = PostBlog.find(params[:id])
    @blog_comment = BlogComment.new
    @tag_list = @post_blog.blog_tags.pluck(:name).join(',')
    @post_blog_tags = @post_blog.blog_tags
  end

  def edit
    @post_blog = PostBlog.find(params[:id])
    @tag_list = @post_blog.blog_tags.pluck(:name).join(',')
  end

  def update
    @post_blog = PostBlog.find(params[:id])
    tag_list = params[:post_blog][:name].split(',')
    if @post_blog.update(post_blog_params)
      @post_blog.save_blog_tags(tag_list)
      redirect_to post_blogs_path
      flash[:notice] = "更新が完了しました"
    else
      flash[:notice] = "ブログ投稿を更新できませんでした"
      render :edit
    end
  end

  def new
    @post_blog = PostBlog.new
  end

  def create
    @post_blog = PostBlog.new(post_blog_params)
    @post_blog.end_user_id = current_end_user.id
    tag_list = params[:post_blog][:name].split(',')
    if @post_blog.save
      @post_blog.save_blog_tags(tag_list)
      redirect_to post_blogs_path, notice:'投稿が完了しました'
    else
      flash[:notice] = "投稿を作成できませんでした"
      render :new
    end
  end

  def destroy
    @post_blog = PostBlog.find(params[:id])
    @post_blog.destroy
    redirect_to post_blogs_path
    flash[:notice] = "削除が完了しました"
  end

  def search_tag
    @tag_list = BlogTag.all
    @tag = BlogTag.find(params[:blog_tag_id])
    @post_blogs = @tag.post_blogs
  end

  private

  def post_blog_params
    params.require(:post_blog).permit(:end_user_id, :image, :start_time, :title, :content)
  end
end
