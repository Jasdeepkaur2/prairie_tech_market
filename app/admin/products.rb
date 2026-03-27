ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock, :category_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :category
    column(:price) { |p| number_to_currency(p.price) }
    column :stock
    column(:image) { |p| image_tag p.image.variant(resize_to_limit: [50, 50]) if p.image.attached? }
    actions
  end

  filter :name
  filter :category
  filter :price

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock
      f.input :category
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image.variant(resize_to_limit: [100, 100])) : "No image uploaded"
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row(:price) { |p| number_to_currency(p.price) }
      row :stock
      row :category
      row(:image) { |p| image_tag p.image.variant(resize_to_limit: [300, 300]) if p.image.attached? }
    end
  end
end
