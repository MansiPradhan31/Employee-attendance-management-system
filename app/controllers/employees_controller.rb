class EmployeesController < ApplicationController
  before_action :set_emp, only: [:show, :update, :destroy, :leave_requests, :create_leave_request]

  def index
    @emp = Employee.all
    render json: @emp
  end

  def show
    render json: @emp
  end

  def create
    @emp = Employee.new(emp_params)
    if @emp.save
      render json: @emp, status: :created
    else
      render json: @emp.errors, status: :unprocessable_entity
    end
  end

  def update
    if @emp.update(emp_params)
      render json: @emp
    else
      render json: @emp.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @emp.destroy
    render json: @emp, status: :ok
  end

  def leave_requests
    leave_requests = @emp.leave_requests
    render json: leave_requests, status: :ok
  end



  def create_leave_request
    leave_request = @emp.leave_requests.new(leave_request_params)
    
    if leave_request.save
      render json: leave_request, status: :created
    else
      render json: leave_request.errors, status: :unprocessable_entity
    end
  end

  private

  def set_emp
    @emp = Employee.find(params[:id])
    render json: @emp.errors, status: 404 if @emp.nil? 
  end
    
  def emp_params
    params.permit(:first_name, :last_name, :email, :gender, :address, :mob_no, :designation, :user_id, :works)
  end

  def leave_request_params
    params.permit(:start_date, :end_date, :reason, :leave_type)
  end
end