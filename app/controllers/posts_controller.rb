class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit,:destroy,:update]
  def index
     @posts = Post.all.order("created_at desc")
  end

  def new
  @post = Post.new
  end

  def create
  if @post = Post.create(post_params)
   flash[:success] = "Your post has been created!"
   redirect_to posts_path
 else
   flash.now[:alert] = "Your new post couldn't be created!  Try again!"
   render :new
  end
end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "Update failed. Try again!"
      render :edit
    end
  end

  def destroy
  @post.destroy
  redirect_to posts_path
  end

  private

  def post_params
  params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
