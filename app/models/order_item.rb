class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :cause_point
end
