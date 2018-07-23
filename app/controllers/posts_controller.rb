require 'pry'
class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update, :create]

  def create
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
#    if @post.update(title: params[:title], category: params[:category], content: params[:content])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
