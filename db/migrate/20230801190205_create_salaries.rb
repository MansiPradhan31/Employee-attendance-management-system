class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries do |t|
      t.decimal :base_salary
      t.decimal :deducted_salary
      t.references :employee, null: false, foreign_key: true
      t.timestamps
    end
  end
end
