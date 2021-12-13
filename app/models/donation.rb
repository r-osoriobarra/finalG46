class Donation < ApplicationRecord
    belongs_to :user
    belongs_to :cause
    enum status: [:pending, :approved, :rejected]
end
