class CreateSkuUnits < ActiveRecord::Migration
  def change
    create_table :sku_units do |t|
      t.integer :sku_id
      t.string :state, limit: 64
    end
  end
end
