class CreateLeaveBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_balances do |t|
      t.decimal :casual_leave
      t.integer :loss_of_pay
      t.references :employee, foreign_key: true
      t.timestamps
    end
  end
end
