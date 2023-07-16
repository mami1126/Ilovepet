class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :prefectures_id, null: false
      t.integer :genre_id, null: false
      t.string :spot_name, null: false
      t.string :address, null: false
      t.string :access
      t.string :telephone_number
      t.text :url
      t.string :facility
      t.string :business_day
      t.timestamps
    end
  end
end
