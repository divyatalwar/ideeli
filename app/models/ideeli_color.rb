class IdeeliColor < ActiveRecord::Base
  include Ideeli::Publishable
  self.table_name = 'colors'

  has_many :skus, :foreign_key => 'color_id', :dependent => :nullify
  has_many :sku_units, :through => :skus
  belongs_to :product
  validates_presence_of :product
  validates_associated :product
  validates :name, uniqueness: {scope: [:product_id], :message => Proc.new{|color| "Product #{color.product.name} already has a color #{color.name}"} }
  after_save :validate_publishing_chain

  scope :for_products, ->(products) { where(product_id:products) }


  def check_publishing_rules
    publishing_errors.add(:name, 'must not be blank') if name.blank?
    logger.info "PR : C : Checking if skus exists"
    publishing_errors.add(:base, "Must have at least one sku") if skus.length.zero?
    logger.info "PR : C : Checking if any sku is unpublishable"
    publishing_errors.add(:base, "All skus must be publishable") if skus.any? do |x| "PR: C : SKU: #{x.id}"; !x.publishable_without_caching? end
  end

  def notify_publishability_upchain!
    logger.info 'UPCHAIN: Product :  #{product.id}' if product
    product.notify_publishability_change! if product
  end

end