class CreateProductInfo < ActiveRecord::Migration
  def change
    create_table :product_infos do |t|
      t.string :name
      t.text :spec
      t.string :brand_code, limit: 16
      t.integer :publishable_flag, :limit => 1
      t.timestamps
    end
  end
end
