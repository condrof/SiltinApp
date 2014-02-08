class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
    	t.integer :product_id, :null => false
    	t.integer :supplier_id, :null => false
    	t.decimal :price, :null => false
    	

      t.timestamps
    end
  end
end
