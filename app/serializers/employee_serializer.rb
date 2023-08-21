class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  belongs_to :user
  has_many :leave_requests
end
