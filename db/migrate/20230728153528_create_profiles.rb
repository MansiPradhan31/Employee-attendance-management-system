class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    drop_table :profiles
    create_table :profiles do |t|
      t.string :image_url
      t.references :employee, foreign_key: true 
      t.timestamps
    end
  end
end
