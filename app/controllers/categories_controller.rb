class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def search
    @garments = Garment.all
    @garments = @garments.where('name LIKE ?', "%#{params[:q]}%")
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    if user_signed_in?
      @category = Category.new
    else
      redirect_to categories_path
    end
  end

  def edit
    if user_signed_in?
      @category = Category.find(params[:id])
    else
      redirect_to categories_path
    end
  end

  def create
    if user_signed_in?
      @category = Category.new(category_params)
      category_save
    else
      redirect_to categories_path
    end
  end

  def update
    if user_signed_in?
      @category = Category.find(params[:id])
      category_update
    else
      redirect_to categories_path
    end
  end

  def destroy
    if user_signed_in?
      @category = Category.find(params[:id])
      @category.destroy
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def category_save
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def category_update
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end
end
