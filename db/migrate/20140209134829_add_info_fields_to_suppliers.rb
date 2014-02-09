class AddInfoFieldsToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :name, :string
    add_column :suppliers, :phone, :string
    add_column :suppliers, :address, :text
  end
end
