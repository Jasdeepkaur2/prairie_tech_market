ActiveAdmin.register Province do
  permit_params :name, :gst, :pst, :hst

  index do
    selectable_column
    id_column
    column :name
    column(:gst) { |p| "#{(p.gst * 100).round(1)}%" }
    column(:pst) { |p| "#{(p.pst * 100).round(1)}%" }
    column(:hst) { |p| "#{(p.hst * 100).round(1)}%" }
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :gst, label: "GST (e.g. 0.05 for 5%)"
      f.input :pst, label: "PST (e.g. 0.07 for 7%)"
      f.input :hst, label: "HST (e.g. 0.15 for 15%)"
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row(:gst) { |p| "#{(p.gst * 100).round(1)}%" }
      row(:pst) { |p| "#{(p.pst * 100).round(1)}%" }
      row(:hst) { |p| "#{(p.hst * 100).round(1)}%" }
    end
  end
end
