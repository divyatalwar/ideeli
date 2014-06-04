class AddPublishableFlagToProducts < ActiveRecord::Migration
  def change
    add_column :products, :publishable_flag, :integer, limit: 1
  end
end
