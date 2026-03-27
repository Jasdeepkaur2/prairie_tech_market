ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Orders" do
          table_for Order.includes(:user, :province).order(created_at: :desc).limit(10) do
            column :id
            column :user
            column :province
            column :total_amount
            column :status
            column :order_date
            column("Actions") { |o| link_to "View", admin_order_path(o) }
          end
        end
      end
      column do
        panel "Store Stats" do
          para "Total Products: #{Product.count}"
          para "Total Orders: #{Order.count}"
          para "Total Users: #{User.count}"
          para "Total Categories: #{Category.count}"
        end
      end
    end
  end
end
