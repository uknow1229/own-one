class Public::PostBlogsController < ApplicationController
  def index
    @post_blogs = PostBlog.all
  end

  def show
    @post_blogs = PostBLog.all
    @post_blog = PostBlog.find(params[:id])
  end

  def edit
  end
end
