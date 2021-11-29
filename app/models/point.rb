class Point < ApplicationRecord
    has_many :order_items
    has_many :cause_points
end
