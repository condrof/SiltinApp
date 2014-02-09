ActiveAdmin.register Product do

  permit_params :name, :unit_id, :image, :description
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do |product|
    selectable_column
    column :id
    column :name
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :unit_id
      row :description
      row "Suppliers" do |product|
        product.suppliers.count
        # product.suppliers.each do |supplier|
        #   #link_to supplier.email, admin_supplier_path(supplier)
        #   supplier.email
        # end
      end
      row :image do |product|
        image_tag product.image.url, alt: product.name + " image"
      end
    end
  end

end
