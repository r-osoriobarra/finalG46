class CausePoint < ApplicationRecord
  belongs_to :cause
  belongs_to :point

  def self.create_point_stock(cause)
    CausePoint.create(
      cause_id: cause.id,
      point_id: 1,
      stock: cause.goal
    )
  end

  def self.update_point_stock(cause)
    CausePoint.update(stock: cause.goal)
  end
  
end
