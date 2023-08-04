class LeaveRequest < ApplicationRecord
    belongs_to :employee
  
    validates :start_date, :end_date, :reason, presence: true
    validates :leave_type, presence: true, inclusion: { in: ['casual leave', 'loss of pay'], message: "is invalid" }
    validate :check_casual_leave_balance, if: :casual_leave?
    after_create :update_leave_balance
    after_create :update_salary
   
    def casual_leave?
        leave_type == 'casual leave'
    end

    def check_casual_leave_balance
      leave_balance = LeaveBalance.find_by(employee_id: employee_id)
      total_casual_leave_days = (end_date - start_date).to_i + 1
  
      if leave_balance.casual_leave.to_f < total_casual_leave_days
        errors.add("Insufficient casual leave balance")
      end
    end
  
    def update_leave_balance
      leave_balance = LeaveBalance.find_by(employee_id: employee_id)
      @total_leave_days = (end_date - start_date).to_i + 1
  
      if casual_leave?
        leave_balance.update(casual_leave: leave_balance.casual_leave - @total_leave_days)
      elsif leave_type == 'loss of pay'
        leave_balance.update(loss_of_pay: leave_balance.loss_of_pay - @total_leave_days)
      end
    end
    
    def update_salary
        emp_sal = Salary.find_by(employee_id: employee_id)
        per_day_amount = emp_sal.base_salary/30
        if leave_type == 'loss of pay'
            emp_sal.update(deducted_salary: @total_leave_days * per_day_amount)
        end
    end
    
  end