class Cause < ApplicationRecord
  belongs_to :project
  has_one :report
  has_many :donations
  has_many :comments  
  after_validation :report_validation_errors_to_rollbar
  
  def unique_founders
    self.approved_donations.distinct.pluck(:user_id).count
  end
  
  def total_donations_clp
    self.approved_donations.pluck(:amount).sum
  end

  def donation_points_amount
    self.approved_donations.pluck(:amount).map {|e| e/1000}.sum
  end

  def percentage_of_goal_achieved
    ((self.donation_points_amount.to_f/self.goal.to_f)*100).round(2)
  end

  def approved_donations
    self.donations.where(status: "approved")
  end
  

  #TODO: agregar un metodo que pueda finalizar la cause cuando se acabe la fecha o cuando se cumpla la meta.
end
