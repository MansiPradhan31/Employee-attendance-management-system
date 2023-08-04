# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 7.times do |i|
#     if i<5
#         r = 'Employee' 
#     else
#         r = 'HR'
#     end
#     User.create(
#     role: r,
#     first_name: "Employee #{i+1}",
#     last_name:"Lname #{i+1}",
#     email: "employee#{i+1}@gmail.com")

# end


# Employee.create(first_name: 'Aman', last_name: 'Mansoori', email: 'aman@gmail.com',gender: 'male', address: 'xyz',mob_no: 5654567620,designation: 'Employee',joining_date: Date.today+6, user_id: 5)

7.times do |i|
  Activity.create(date: '2023-08-01',login_time: Time.now, logout_time: Time.now + 10000, employee_id: "#{i+1}")
end

7.times do |i|
  Activity.create(date: '2023-08-01',login_time: Time.now + 11000, logout_time: Time.now + 15000, employee_id: "#{i+1}")
end

# 7.times do |i|
#   Profile.create(image_url: "EmployeeImage", employee_id: "#{i+1}")
# end

# 7.times do |i|
#   LeaveBalance.create(casual_leave: 2.0,loss_of_pay: 0, employee_id: "#{i+1}")
# end

# 7.times do |i|
#   Salary.create(base_salary: 30000.00, deducted_salary: 0.0,employee_id: "#{i+1}")
# end