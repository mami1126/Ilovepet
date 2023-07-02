class CreateHelpfuls < ActiveRecord::Migration[6.1]
  def change
    create_table :helpfuls do |t|
      t.integer :comment_id, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
