class ShoppingEvent < ActiveRecord::Base
  include Ideeli::Publishable
  belongs_to :sku
end