class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    render json: @profile
  end

  def create
    @profile = Profile.new(user_params)
    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(user_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy
    render json: @emp, status: :ok
  end

  private

  def set_user
    @profile = Profile.find_by(employee_id: params[:employee_id])
    render json: @profile.errors, status: 404 if @profile.nil? 
  end
    
  def user_params
    params.permit(:image_url, :employee_id)
  end

end
