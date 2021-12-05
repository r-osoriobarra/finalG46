class Point < ApplicationRecord
    has_many :order_items
    has_many :cause_points

    enum name: ["Punto", "Super Punto", "Mega Punto", "Apaña Punto"]
end
