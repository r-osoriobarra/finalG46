class Project < ApplicationRecord
  after_validation :report_validation_errors_to_rollbar
  belongs_to :user
  has_many :causes, dependent: :destroy
end
