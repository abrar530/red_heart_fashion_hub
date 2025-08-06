class StoreController < ApplicationController
  def index
    @categories = Category.all

    @products = Product.all

    if params[:category_id].present? && params[:category_id] != ""
      @products = @products.where(category_id: params[:category_id])
    end

    if params[:search].present?
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    @products = @products.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end
end
