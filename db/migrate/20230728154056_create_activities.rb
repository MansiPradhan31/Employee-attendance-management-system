class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.date :date
      t.time :login_time
      t.time :logout_time
      t.string :logout_region
      t.references :employee, foreign_key: true
      
      t.timestamps
    end
  end
end
