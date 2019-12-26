class CommentsController < ApplicationController
  before_action :set_post

  def show
    @comments = @post.comments
    @comment = @post.coment.build
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params) 
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: '投稿できませんでした...' }
      end
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :index }
      else
        format.js { render :errors }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id]) 
    if @comment.destroy
      render :index 
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:image, :message, :user_id, :post_id, :image_cache)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
