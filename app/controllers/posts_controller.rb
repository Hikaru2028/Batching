class PostsController < ApplicationController
 
  before_action :authenticate_user!

  def top
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    post.user_id = current_user.id

    if @post.save
       redirect_to :action => "index"
    else
       redirect_to :action => "new"
    end

  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @like = Like.new
    @post.user_id = current_user.id
  
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_index_path, notice:"削除しました"
  end

 private

  def post_params
    params.require(:post).permit(:title, :body, :start_time, :end_time)
  end

end
