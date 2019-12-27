class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
    
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comment = Comment.new 
    @comments = @post.comments 
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
    
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :image, :youtube_url)
    end

    def search_params
      params.require(:q).permit(:content_cont)
    end
end
