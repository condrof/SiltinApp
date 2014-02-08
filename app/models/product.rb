class Product < ActiveRecord::Base
	has_many :inventories
	has_many :suppliers, through: :inventories, :foreign_key => :product_id
	belongs_to :unit

end
