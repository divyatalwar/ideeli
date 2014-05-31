class CreateColor < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.integer :product_id
      t.string :name
      t.integer :position
      t.integer :publishable_flag, limit:1 
      t.integer :deleted, limit: 1, default: 0
      t.timestamps
    end
  end
end
