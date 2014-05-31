class CreateShoppingEvent < ActiveRecord::Migration
  def change
    create_table :shopping_events do |t|
     t.string :title
     t.datetime :start_at
     t.datetime :end_at
     t.integer :group_id
     t.string :brand
     t.text :email_editorial
     t.datetime :canceled_at
     t.integer :group_position, default: 0

     t.timestamps
    end
  end
end
