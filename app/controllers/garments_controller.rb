class GarmentsController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @garment = @category.garments.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @garment = @category.garments.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @garment = Garment.new
  end

  def create
    @category = Category.find(params[:category_id])
    @garment = @category.garments.create(garment_params)
    redirect_to category_path(@category)
  end

  def update
    @category = Category.find(params[:category_id])
    @garment = @category.garments.find(params[:id])

    if @garment.update(garment_params)
      redirect_to @garment
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @garment = @category.garments.find(params[:id])
    @garment.destroy
    redirect_to category_path(@category)
  end

  private

  def garment_params
    params.require(:garment).permit(:name, :description, :price, :color, :image)
  end
end
