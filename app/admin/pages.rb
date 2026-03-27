ActiveAdmin.register Page do
  permit_params :slug, :title, :body

  index do
    selectable_column
    id_column
    column :slug
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :slug
      f.input :title
      f.input :body, as: :text
    end
    f.actions
  end
end
