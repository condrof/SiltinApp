ActiveAdmin.register Inventory do
  permit_params :product, :supplier, :price, :product_id, :supplier_id

  index do |inv|
    config.clear_sidebars!
    selectable_column
    column :product
    column :price
    actions
  end

  form do |f|
    f.inputs "Edit Inventory" do 
      f.input :product, collection: Product.all
      f.input :supplier_id, as: :hidden, value: current_user.id
      f.input :price
      f.actions
    end
  end
  
end
