class Offer < ActiveRecord::Base
  include Ideeli::Publishable
  belongs_to :product
  belongs_to :shopping_event

  after_save :validate_publishing_chain

  validates_presence_of  :product
  scope :for_products, ->(products) { where(product_id: products) }
  scope :for_shopping_events, ->(events) {where(shopping_event_id:events)}

  def sweepstake?
    self[:type] == 'Sweepstake'
  end
  alias :giveaway? :sweepstake?

  def check_publishing_rules
    publishing_errors.add(:canceled_at, 'cannot be set') if canceled?    
    publishing_errors.add(:product_id, 'must exist') unless product
    publishing_errors.add(:product_id, 'must be publishable') if product && !product.publishable_without_caching?
    publishing_errors.add(:msrp,  'must be more than $0 for all of the skus in a non-sweepstake offer') if !sweepstake? && all_skus.to_a.any? {|s| s.msrp.cents <= 0}
    publishing_errors.add(:price,  'must be more than $0 for all of the skus in a non-sweepstake offer') if !sweepstake? && all_skus.to_a.any? {|s| s.price.cents <= 0}
  end
  
  def notify_publishability_upchain!
    shopping_event.notify_publishability_change! if shopping_event
  end

  def canceled?(now = Time.now)
    canceled_at && canceled_at <= now
  end
  
  def skus
    product ? product.unordered_skus.all(:joins => :sku_units, :readonly => false) : []
  end
  
  # this method returns all the skus even if they have no sku unit assigned to them
  def all_skus
    product ? product.unordered_skus : []
  end


end