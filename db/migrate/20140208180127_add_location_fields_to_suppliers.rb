class AddLocationFieldsToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :latitude, :real
    add_column :suppliers, :longitude, :real
  end
end
