class Donation < ApplicationRecord
    belongs_to :user
    belongs_to :cause
    belongs_to :point

    enum status: [:pending, :approved, :rejected]

    after_validation :report_validation_errors_to_rollbar
end
