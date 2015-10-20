class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @posts = Post.tagged_with(@tag.name)
  end

  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new
  end

  def create
   @post = Post.find(params[:post_id])
   @tag = @post.tags.new(tag_params)
   if @tag.save
     redirect_to post_path(@tag.post)
   else
     render :new
   end
 end

  def edit
  #   @tag =  ActsAsTaggableOn::Tag.find(params[:id])
  #   @post = Post.tagged_with(@tag.name)
  end

  def update
    @post = Post.find(params[:id])
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @tag.destroy
    redirect_to posts_path
  end
end
