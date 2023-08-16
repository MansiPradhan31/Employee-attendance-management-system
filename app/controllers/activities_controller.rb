class ActivitiesController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @activity = Activity.where(employee_id: params[:employee_id])
    render json: @activity
  end

  def show
    render json: @activity
  end

  def create
    @activity = Activity.new(user_params)
    if @activity.save
      render json: @activity, status: :created
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update(user_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
  end

  private

  def set_user
    @activity = Activity.find_by(id: params[:id])
    render json: @activity.errors, status: 404 if @activity.nil? 
  end
    
  def user_params
    params.permit(:date, :login_time, :logout_time, :logout_region, :employee_id)
  end
  
end