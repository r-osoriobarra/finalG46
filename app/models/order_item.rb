class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :point
end
