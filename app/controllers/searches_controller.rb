class SearchesController < ApplicationController
  def index
    @garments = Garment.all
    
    if params[:search_by_name] && params[:search_by_name] != ""
      @garments = @garments.where("name like ?", 
      "%# {params[:search_by_name]}%")
    end
    if params[:search_by_color] && params[:search_by_color] != ""
      @garments = @garments.where("color like ?", 
      "%# {params[:search_by_color]}%")
    end
    if params[:search_by_price] && params[:search_by_price] != ""
      @garments = @garments.where("price like ?", 
      "%# {params[:search_by_price]}%")
    end
  end
  def show
    @garments
  end
end
