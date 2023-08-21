class LeaveRequestSerializer < ActiveModel::Serializer
  attributes :id, :leave_type, :status
end
