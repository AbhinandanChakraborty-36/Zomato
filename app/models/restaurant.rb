class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many_attached :pictures, dependent: :destroy
  has_many :ords, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  scope :search_name, ->(search) { where('name LIKE ?', '%' + search + '%') }
  scope :search_type, ->(search) { where('resturant_type LIKE ?', '%' + search + '%') }

  def address; end
end