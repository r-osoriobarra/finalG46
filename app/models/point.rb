class Point < ApplicationRecord
    
    has_many :donations

    enum name: ["Punto", "Super Punto", "Mega Punto", "Apaña Punto"]
end
    