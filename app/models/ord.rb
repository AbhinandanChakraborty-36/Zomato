class Ord < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :ord_items, dependent: :destroy
end
