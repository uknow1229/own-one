class Public::PostBlogsController < ApplicationController
  def index
    @post_blogs = PostBlog.all
  end

  def show
  end

  def edit
  end
end
