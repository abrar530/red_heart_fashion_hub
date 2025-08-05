ActiveAdmin.register Product do
  # Only include permitted fields
  permit_params :name, :description, :price, :category_id, :image

  # Optional: To avoid trying to auto-filter on image, define filters manually
  filter :name
  filter :description
  filter :price
  filter :category
  filter :created_at
  # Do NOT include `image` here

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    column :created_at
    column "Image" do |product|
      if product.image.attached?
        image_tag url_for(product.image), width: 100
      else
        "No image"
      end
    end
    actions
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price, min: 0.01, step: 0.01
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
      row :category
      row :created_at
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), width: 200
        else
          "No image"
        end
      end
    end
  end
end
