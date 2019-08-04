class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end
  def new 
    @post = Post.new
  end
  def create
    @post = Post.new(posts_params)
    if @post.save
      flash[:success] = "post submitted"
      redirect_to root_path
    else
      flash[:warning] = "post could not be submitted"
      redirect_to root_path
    end
  end

  def show
    @post= Post.find(params[:id])
  end

  def edit
    @post= Post.find(params[:id])
  end
  
  private
  def posts_params
    params.require(:post).permit(:author , :headline , :content )
  end
end
