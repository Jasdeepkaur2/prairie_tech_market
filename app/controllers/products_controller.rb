class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @products = @products.on_sale if params[:filter] == "on_sale"
    @products = @products.new_arrivals if params[:filter] == "new"
    @products = @products.recently_updated if params[:filter] == "recently_updated"
    @products = @products.page(params[:page]).per(12)
    @categories = Category.all
    @current_filter = params[:filter]
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
