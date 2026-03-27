ActiveAdmin.register User do
  permit_params :name, :email, :phone, :admin, :province_id

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    column :admin
    column :province
    actions
  end

  filter :name
  filter :email
  filter :admin

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :admin
      f.input :province
    end
    f.actions
  end
end
