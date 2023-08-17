class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :view_leave_requests, :approve_leave_request]
  
  def index
    @user = User.all
    render json: @user
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render  json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: @user, status: :ok
  end

  def view_leave_requests
    if @user.role == 'HR'
      leave_requests = LeaveRequest.all
      render json: leave_requests, status: :ok
    else
      render json: {errors: 'Only HR can view leave requests'}, status: :forbidden
    end
  end

  def approve_leave_request
    if @user.role == 'HR'
      leave_request = LeaveRequest.find(params[:id])
      new_status = params[:status]
      if new_status == 'Approved' || new_status == 'Cancelled'
        leave_request.update(status: new_status)
        render json: leave_request, status: :ok
      else
        render json: {errors: 'Only Approved or Cancelled are allowed.'},status: :bad_request
      end
    else
      render json: {errors: 'Only HR can approve leave requests'},status: :forbidden
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    render json: @user.errors, status: 404 if @user.nil? 
  end
    
  def user_params
    params.permit(:role, :first_name, :last_name, :email)
  end
end
