ActiveAdmin.register Supplier do

  permit_params :email, :latitude, :longitude

  index do |supplier|
    column :id
    column :email
    column :latitude
    column :longitude
    actions
  end

  form do |f|
    f.inputs "Update Supplier" do
      f.input :email
      f.input :latitude
      f.input :longitude
      f.input :name
      f.input :phone
      f.input :address
      f.actions
    end
  end
end
