class AddDescriptionToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :description, :text
  end
end
