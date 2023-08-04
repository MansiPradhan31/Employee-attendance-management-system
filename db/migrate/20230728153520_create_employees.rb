class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.text :address
      t.integer :mob_no
      t.string :designation
      t.date :joining_date
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
