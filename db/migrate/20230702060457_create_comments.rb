class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customer_id, null: false
      t.integer :spot_id, null: false
      t.text :review
      t.float :rate
      t.timestamps
    end
  end
end
