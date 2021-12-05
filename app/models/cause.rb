class Cause < ApplicationRecord
  belongs_to :project
  has_one :report
  has_many :cause_points
  has_many :comments  
end
