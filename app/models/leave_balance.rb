class LeaveBalance < ApplicationRecord  
  belongs_to :employee  
  validates :casual_leave, numericality: {greater_than_or_equal_to: 0}
end
