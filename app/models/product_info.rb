class ProductInfo < ActiveRecord::Base
  has_one :product
  delegate :brand_code, to: :product
end