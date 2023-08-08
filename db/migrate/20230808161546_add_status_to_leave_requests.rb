class AddStatusToLeaveRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :leave_requests, :status, :string, default: 'pending'
  end
end
