class Supplier < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :inventories
  has_many :products, through: :inventories, :foreign_key => :supplier_id

  acts_as_mappable lat_column_name: :latitude, lng_column_name: :longitude
end
