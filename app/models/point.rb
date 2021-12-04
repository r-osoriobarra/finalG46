class Point < ApplicationRecord
    has_many :order_items
    has_many :cause_points
    has_many :causes, through: :cause_points

end
