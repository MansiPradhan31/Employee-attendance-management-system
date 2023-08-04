class CreateLeaveRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :reason
      t.string :leave_type
      t.references :employee, foreign_key: true 
      t.timestamps
    end
  end
end
