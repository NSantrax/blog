class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
   	  redirect_to posts_path, notice: 'Запись сохранена'
    else
    	render :new
    end
  end

  def update
      if @post.update(post_params)
        redirect_to posts_path, notice: 'Запись изменена'
      else
        render :edit
      end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Запись удалена'
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:id, :title, :text)
  end

end
