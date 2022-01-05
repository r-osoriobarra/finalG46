class Point < ApplicationRecord
    
    has_many :donations

    enum name: ["Apaña Punto", "Super Punto", "Mega Punto", "Hiper Punto"]
end
    