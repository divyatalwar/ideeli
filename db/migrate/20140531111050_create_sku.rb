class CreateSku < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.string :size, limit: 50
      t.integer :color_id, default: 0
      t.string :code
      t.integer :publishable_flag, limit: 1
      t.string :season
      t.integer :price_cents
      t.integer :msrp_cents
    end
  end
end
