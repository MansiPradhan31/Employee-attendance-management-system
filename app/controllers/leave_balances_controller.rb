class LeaveBalancesController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @balance = LeaveBalance.find_by(employee_id: params[:employee_id])
    render json: @balance
  end

  def show
    render json: @balance
  end

  def create
    @balance = LeaveBalance.new(user_params)
    if @balance.save
      render json: @balance, status: :created
    else
      render json: @balance.errors, status: :unprocessable_entity
    end
  end

  def update
    if @balance.update(user_params)
      render json: @balance
    else
      render json: @balance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @balance.destroy
    head :no_content
  end

  private

  def set_user
    @balance = LeaveBalance.find_by(id: params[:id])
    render json: @balance.errors, status: 404 if @balance.nil? 
  end
    
  def user_params
    params.permit(:casual_leave, :loss_of_pay, :employee_id)
  end    
end
