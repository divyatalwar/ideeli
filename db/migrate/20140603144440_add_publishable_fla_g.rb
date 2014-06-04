class AddPublishableFlaG < ActiveRecord::Migration
  def change
    add_column :shopping_events, :publishable_flag, :integer, limit:1
    add_column :shopping_event_groups, :publishable_flag, :integer, limit:1
    
  end
end
