class CartController < ApplicationController
  def show
    @cart_items = cart_items
  end

  def add_item
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i
    session[:cart] ||= {}
    session[:cart][product.id.to_s] ||= 0
    session[:cart][product.id.to_s] += quantity
    redirect_to cart_path, notice: "#{product.name} added to cart!"
  end

  def update_item
    session[:cart] ||= {}
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    if quantity > 0
      session[:cart][product_id] = quantity
    else
      session[:cart].delete(product_id)
    end
    redirect_to cart_path, notice: "Cart updated."
  end

  def remove_item
    session[:cart] ||= {}
    session[:cart].delete(params[:product_id].to_s)
    redirect_to cart_path, notice: "Item removed from cart."
  end

  private

  def cart_items
    return [] if session[:cart].blank?
    session[:cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      { product: product, quantity: quantity }
    end.compact
  end
end
