class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @products = @products.page(params[:page]).per(12)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @categories = Category.all
    @query = params[:query]
    @category_id = params[:category_id]
    @products = Product.all
    @products = @products.where("name LIKE ? OR description LIKE ?", "%#{@query}%", "%#{@query}%") if @query.present?
    @products = @products.where(category_id: @category_id) if @category_id.present?
    @products = @products.page(params[:page]).per(12)
  end
end
