class CreateOffer < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :product_id
      t.datetime :canceled_at
      t.string :discount_color,  default: 'o'
      t.integer :shopping_event_id
      t.integer :publishable_flag, limit: 1
      t.string :keyword
      t.string :type, limit: 13
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
