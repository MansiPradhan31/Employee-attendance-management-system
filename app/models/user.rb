class User < ApplicationRecord
  has_many :employees
    
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "is not a valid email"}
  validates :role, presence: true, inclusion: {in: ['Employee', 'HR'], message: "is invalid"}

  def all_employees
    return Employee.all if role == 'HR' 
    errors.add('Only Hr can see the employee details')
  end 
  
  def view_leave_request 
    return LeaveRequest.all if role == 'HR'
    errors.add('Only Hr can see the LeaveRequest details')
  end 
  
  def update_leave_request(leave_request, new_status)
    return unless role == 'HR'
    leave_request.update(status: new_status)
  end


  def employee_activities
    return Activity.all if role == 'HR'
    errors.add('Only Hr can see the Activity details')
  end
end
