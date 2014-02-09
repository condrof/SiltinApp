ActiveAdmin.register Supplier do

  permit_params :email, :address, :name, :phone, :description

  index do |supplier|
    column :id
    column :name
    column :phone
    column :email
    column :address
    actions
  end

  form do |f|
    f.inputs "Update Supplier" do
      f.input :name
      f.input :phone
      f.input :email
      f.input :address, as: :text
      f.input :description
      f.actions
    end
  end
end
