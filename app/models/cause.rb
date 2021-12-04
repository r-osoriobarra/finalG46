class Cause < ApplicationRecord
  belongs_to :project
  has_one :report
  has_many :cause_points
  has_many :points, through: :cause_points
  has_many :comments

  #TODO: crear la asociacion para poder asignar una meta a la causa. Ver como se hace la asociacion con cause_point y points para el ecommerce
  
end
