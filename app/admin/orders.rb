ActiveAdmin.register Order do
  permit_params :status

  index do
    selectable_column
    id_column
    column :user
    column :province
    column :total_amount
    column :status
    column :order_date
    actions
  end

  filter :status
  filter :user

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ["pending", "paid", "shipped"]
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :province
      row :total_amount
      row :status
      row :order_date
    end
    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price_at_purchase
      end
    end
  end
end
