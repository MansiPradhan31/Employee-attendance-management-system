class SalariesController < ApplicationController
      
    def show
      @salary = Salary.where(employee_id: params[:employee_id])  
      render json: @salary
    end
  
    def create
      @salary = Salary.new(user_params)
      if @salary.save
        render json: @salary, status: :created
      else
        render json: @salary.errors, status: :unprocessable_entity
      end
    end
  
    private
        
    def user_params
      params.permit(:base_salary, :employee_id)
    end
  
  end
  