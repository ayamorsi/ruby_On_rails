class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    #instance variable empty object of model
    @post =  Post.new
  end

  def create
    # render plain: params[:posts].inspect
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.save
    redirect_to @post
  end

  def update
    @post = Post.find params[:id]
    if @post.update post_params
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find params[:id]

  end

  def destroy
    @post = Post.find params[:id]
    if @post.destroy
      redirect_to posts_path
    end
  end
end


private
def  Post_params 
  params.require(:post).permit(:title, :text)
end