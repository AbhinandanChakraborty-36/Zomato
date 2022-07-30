class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many_attached :pictures, dependent: :destroy
  has_many :ords, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  def address; end
end
