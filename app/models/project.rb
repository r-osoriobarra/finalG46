class Project < ApplicationRecord
  belongs_to :user
  has_many :causes, dependent: :destroy
end
