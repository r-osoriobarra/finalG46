class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :cause_points, through: :order_items
  has_many :payments, dependent: :destroy
end
