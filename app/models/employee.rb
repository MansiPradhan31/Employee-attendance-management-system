class Employee < ApplicationRecord
  has_many_attached :works

  has_many :activities
  has_many :leave_requests
  has_many :leave_balances
  has_one :profile
  has_one :salary
  belongs_to :user

  validates :first_name, :last_name, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "is not a valid email"}
  validates :gender, presence: true, inclusion: {in: ['male', 'female', 'other'], message: "is invalid"}
  validates :mob_no, presence: true, uniqueness: true,length: {is: 10}
  validates :joining_date, :address, :designation, presence: true

  def salary
    emp = Salary.find_by(employee_id: id)
    return (emp.base_salary - emp.deducted_salary).to_f
  end
end
