class Category < ApplicationRecord
    has_many :users, dependent: :destroy
    enum name: ["Founder", "SuperFounder", "MegaFounder", "ApañadorFounder"]
end
