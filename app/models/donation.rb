class Donation < ApplicationRecord
    enum status: [:pending, :approved, :rejected]
end
