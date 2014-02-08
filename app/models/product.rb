class Product < ActiveRecord::Base
	has_many :inventories
	has_many :suppliers, through: :inventories, :foreign_key => :product_id	
end
