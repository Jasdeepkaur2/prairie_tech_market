ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock, :category_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :price
    column :stock
    actions
  end

  filter :name
  filter :category
  filter :price

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock
      f.input :category
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock
      row :category
      row(:image) { |p| image_tag p.image if p.image.attached? }
    end
  end
end
