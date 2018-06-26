class PostsController < ApplicationController
  
  before_action :find_category

  def index
    @posts = @category.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to category_post_path(@category, params[:id])

    if @post.update_attributes(post_params)
      flash[:success] = 'Updated successfully'
      redirect_to category_post_path(@category, params[:id])
    else
      flash[:error] = "Make sure you are fillin in all the fields"
      redirect_to edit_category_post_path(@category, params[:id])
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    
    if @post.save
      redirect_to category_posts_path(@category)
    else
      redirect_to new_category_post_path
      flash[:error] = "Make sure you are fillin in all the fields"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to category_posts_path(@category)

  end

  private 

  def find_category
    @category = Category.find(params[:category_id])
  end

  def post_params
    output = params.require(:post).permit(:name, :author, :body, :category_id)
    output.merge(category_id: @category.id)
  end
end