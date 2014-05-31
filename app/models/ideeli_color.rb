class IdeeliColor < ActiveRecord::Base
  include Ideeli::Publishable

  has_many :skus, :foreign_key => 'color_id', :conditions => ['skus.deleted = 0'], :dependent => :nullify
  as_many :sku_units, :through => :skus
  belongs_to :product
  validates_presence_of :product
  validates_associated :product
  validates :name, uniqueness: {scope: [:product_id], :message => Proc.new{|color| "Product #{color.product.name} already has a color #{color.name}"} }
  after_save :validate_publishing_chain

  scope :for_products, ->(products) { where(product_id:products) }


  def check_publishing_rules
    publishing_errors.add(:name, 'must not be blank') if name.blank?
    publishing_errors.add_to_base("Must have at least one sku") if skus.length.zero?
    publishing_errors.add_to_base("All skus must be publishable") if skus.any? {|x| !x.publishable_without_caching? }
  end

  def notify_publishability_upchain!
    product.notify_publishability_change! if product
  end