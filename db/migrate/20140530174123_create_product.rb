class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :strapline
      t.string :brand_name
      t.integer :info_id
    end
  end
end
