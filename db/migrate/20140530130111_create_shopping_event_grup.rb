class CreateShoppingEventGrup < ActiveRecord::Migration
  def change
    create_table :shopping_event_groups do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
