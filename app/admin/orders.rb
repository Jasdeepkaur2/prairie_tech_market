ActiveAdmin.register Order do
  permit_params :status

  index do
    selectable_column
    id_column
    column :user
    column :province
    column(:total_amount) { |o| number_to_currency(o.total_amount) }
    column :status
    column :order_date
    actions
  end

  filter :status
  filter :user
  filter :order_date

  show do
    attributes_table do
      row :user
      row :province
      row(:total_amount) { |o| number_to_currency(o.total_amount) }
      row :status
      row :order_date
    end
    panel "Order Items" do
      table_for order.order_items.includes(:product) do
        column(:product) { |i| i.product.name }
        column :quantity
        column(:price) { |i| number_to_currency(i.price_at_purchase) }
        column(:subtotal) { |i| number_to_currency(i.price_at_purchase * i.quantity) }
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ["pending", "paid", "shipped"]
    end
    f.actions
  end
end
