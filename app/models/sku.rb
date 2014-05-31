class Sku < ActiveRecord::Base
  include Ideeli::Publishable
  belongs_to :color, :class_name => "IdeeliColor", :foreign_key => "color_id"
  has_many :shopping_events, :finder_sql => 'select distinct se.* from shopping_events se join offers o on se.id = o.shopping_event_id join colors c on c.product_id = o.product_id where c.id = #{color_id}'
  has_many :sku_units, :dependent => :destroy
  delegate :product, :to => :color

  validates_presence_of :color 
  validates_presence_of :size#, :unless => Proc.new { |s| s.hide_size }

  validates_presence_of :brand_code, :if => :brand_code_required?
  validates_length_of :brand_code, :is => 3, :if => :brand_code_required?
  after_save :validate_publishing_chain

  def check_publishing_rules
  end

  def notify_publishability_upchain!
    color.notify_publishability_change! if color
  end

  def brand_code_required?
    code.blank? && color && color.product && color.product.brand_code.blank?
  end

  def available_to_sell(query_time = Time.now)
    IMS.get_inventory([code], {:attributes => [:available_to_sell], :time_for_data => query_time})[code][:available_to_sell]
  end


end