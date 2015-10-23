class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Thank you for your comment."
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
      if @comment.update(comment_params)
        flash[:notice] = "Update successful."
        redirect_to post_path(@post)
      else
        render :edit
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment is deleted."
    redirect_to post_path(@post)
end

private
  def comment_params
    params.require(:comment).permit(:text, :public_name)
  end
end
