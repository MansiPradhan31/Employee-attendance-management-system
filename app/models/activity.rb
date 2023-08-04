class Activity < ApplicationRecord
  belongs_to :employee

  validates :date, :login_time, :logout_time, presence: true  
end
