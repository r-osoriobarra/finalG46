class Point < ApplicationRecord
    #TODO: crear una tabla intermedia para que desde donaciones se puede comprar diferentes tipos de puntos
    enum name: ["Punto", "Super Punto", "Mega Punto", "Apaña Punto"]
end
    