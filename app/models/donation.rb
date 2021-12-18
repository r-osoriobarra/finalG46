class Donation < ApplicationRecord
    belongs_to :user
    belongs_to :cause
    enum status: [:pending, :approved, :rejected]
    after_validation :report_validation_errors_to_rollbar
end
