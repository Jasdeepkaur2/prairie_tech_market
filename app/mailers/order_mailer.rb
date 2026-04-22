class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @order_items = order.order_items.includes(:product)
    @subtotal = @order_items.sum { |i| i.price_at_purchase * i.quantity }
    @tax = @order.total_amount - @subtotal
    mail(
      to: order.user.email,
      subject: "Order Confirmation ##{order.id} - Prairie Tech Market"
    )
  end
end
