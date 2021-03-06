class Supplier < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :inventories
  has_many :products, through: :inventories, :foreign_key => :supplier_id

  acts_as_mappable lat_column_name: :latitude, lng_column_name: :longitude,
    auto_geocode: {
      field: :address,
      error_message: 'Could not geocode address'
    }

  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
end
