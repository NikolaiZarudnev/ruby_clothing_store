class GarmentsController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @garment = @category.garments.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @garment = Garment.new
  end

  def edit
    @category = Category.find(params[:category_id])
    @garment = @category.garments.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    if params['garment']['image'].nil? then params['garment']['image'] = 'none.jpg'
    else
      image_load
    end
    @garment = @category.garments.create(garment_params)
    redirect_to category_path(@category)
  end

  def update
    @category = Category.find(params[:category_id])
    @garment = @category.garments.find(params[:id])

    unless params['garment']['image'].nil?
      image_load
    end

    @garment.update(garment_params)

    redirect_to category_path(@category)
    #  redirect_to @garment
    # else
    # render 'edit'
    # end
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

  def image_load
    uploaded_io = garment_params['image']
    File.open(Rails.root.join('app', 'assets', 'images', 'garment_img', uploaded_io.original_filename),
    'wb') do |file|
      file.write(uploaded_io.read)
    end
    params['garment']['image'] = uploaded_io.original_filename
  end
end
