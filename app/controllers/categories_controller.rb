class CategoriesController < ApplicationController
  before_action :require_admin_role, only: [:new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "#{@category.name} has been created"
    else
      flash.now[:alert] = 'Invalid Category name, or Category already exists.'
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category, notice: "#{@category.name} has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "#{@category.name} has been deleted"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
