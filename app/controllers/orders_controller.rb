class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.includes(:order_items, :province).order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items.includes(:product)
  end

  def new
    redirect_to cart_path, alert: "Your cart is empty." if session[:cart].blank?
    @provinces = Province.all
    @cart_items = cart_items
    @subtotal = @cart_items.sum { |i| i[:product].price * i[:quantity] }
    @province = current_user.province
  end

  def create
    @provinces = Province.all
    @cart_items = cart_items
    @subtotal = @cart_items.sum { |i| i[:product].price * i[:quantity] }
    province = Province.find(params[:province_id])

    tax = calculate_tax(@subtotal, province)
    total = @subtotal + tax

    order = current_user.orders.build(
      province: province,
      order_date: Time.current,
      total_amount: total,
      status: "pending"
    )

    if order.save
      @cart_items.each do |item|
        order.order_items.create!(
          product: item[:product],
          quantity: item[:quantity],
          price_at_purchase: item[:product].price
        )
      end
      session[:cart] = {}
      redirect_to order_path(order), notice: "Order placed successfully!"
    else
      render :new, status: :unprocessable_entity
    end
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

  def calculate_tax(subtotal, province)
    if province.hst > 0
      subtotal * province.hst
    else
      subtotal * (province.gst + province.pst)
    end
  end
end
