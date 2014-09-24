class PostsController < ApplicationController

  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(params[:post].permit(:title, :text))
    redirect_to @post
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

end
