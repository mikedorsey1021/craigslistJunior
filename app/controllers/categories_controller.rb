class CategoriesController < ApplicationController
  def index
    @categories = Category.all 
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])

  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      flash[:success] = 'Updated successfully'
      redirect_to category_path(@category)
    else
      flash[:error] = "Make sure you are fillin in all the fields"
      redirect_to edit_category_path(params[:id])
    end

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create!(category_params)

    if @category.save
      redirect_to categories_path
    elsif @category.params[:name] == ""
      redirect_to new_category_path
      flash[:error] = "Make sure you are fillin in all the fields"
    else
      redirect_to new_category_path
      flash[:error] = "Make sure you are fillin in all the fields"
    end

  end

  def destroy
    @category = Category.find(params[:id])

    @category.posts.each do |post|
      post.destroy
    end

    @category.destroy

    redirect_to categories_path

  end

  private 

  def category_params
    params.require(:category).permit(:name)
  end
end