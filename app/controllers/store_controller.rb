class StoreController < ApplicationController
  def index
    @categories = Category.all

    @products = Product.all
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @products = @products.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @product = Product.find(params[:id])
  end
end
