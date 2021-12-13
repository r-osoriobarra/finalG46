class Cause < ApplicationRecord
  belongs_to :project
  has_one :report
  has_many :donations
  has_many :comments  

  def unique_founders
    self.donations.pluck(:user_id).count
  end

  def total_donations_clp
    self.donations.pluck(:amount).sum
  end

  def donation_points_amount
    self.donations.pluck(:amount).map {|e| e/1000}.sum
  end

  def percentage_of_goal_achieved
    (self.donation_points_amount/self.goal).to_f
  end

  #TODO: agregar un metodo que pueda finalizar la cause cuando se acabe la fecha o cuando se cumpla la meta.
end
