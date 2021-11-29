class Cause < ApplicationRecord
  belongs_to :pyme_project
  has_one :report
  has_many :cause_points
  has_many :comments

end
