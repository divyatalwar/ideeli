class ShoppingEvent < ActiveRecord::Base
  include Ideeli::Publishable
  belongs_to :group, :class_name => 'ShoppingEventGroup', :foreign_key => 'group_id'
  
  has_many :offers, :dependent => :nullify
  # has_many :unordered_offers, :dependent => :nullify, :class_name => "Offer"
  has_many :products, :through => :offers

  # has_many :colors, :class_name => "IdeeliColor",
                    # :finder_sql => 'select distinct c.* from colors c inner join products p on p.id = c.product_id inner join offers o on o.product_id = p.id where o.shopping_event_id = #{id} and c.deleted = 0 order by o.position, c.position'
                    
  # has_many :colors_with_non_deleted_sku_units, :class_name => "IdeeliColor",
                    # :finder_sql => 'select distinct c.* from colors c inner join products p on p.id = c.product_id inner join skus s on s.color_id = c.id and s.deleted = 0 inner join offers o on o.product_id = p.id inner join sku_units su on su.sku_id = s.id and su.state != "deleted" where o.shopping_event_id = #{id} and c.deleted = 0 order by o.position, c.position'

  after_save :validate_publishing_chain
  

  def check_publishing_rules_without_offers(check_coming_soon_publishability = true)
   
    publishing_errors.add(:start_at, 'must be before end date') if end_at && start_at && end_at <= start_at
       
    publishing_errors.add(:brand, 'must not be blank') if brand.blank?
    publishing_errors.add(:canceled_at, 'cannot be set') if canceled_at?
    logger.info "PR: Checking if offers exists"

    publishing_errors.add(:base, "Must have at least one associated offer") if offers.length.zero?
   
    
    # check_publishing_channels
  end

  def self.colors
    ShoppingEvent.find_by_sql('select distinct c.* from colors c inner join products p on p.id = c.product_id inner join offers o on o.product_id = p.id where o.shopping_event_id = #{id} and c.deleted = 0 order by o.position, c.position')
  end
  
  def check_publishing_rules
    check_publishing_rules_without_offers
    logger.info "PR: Checking if any offer is unpublishable"
    publishing_errors.add(:base, "One or more offers are unpublishable") unless offers.all?(&:publishable_without_caching?)
    # publishing_errors.add_to_base("All offers have no units available at event start") unless full_skus.any? { |sku| sku.available_to_sell(start_at) > 0 }
  end


  def skus
    Sku.all(:select => 'distinct(skus.id)', :joins => "join offers on offers.shopping_event_id = #{id} join products on products.id = offers.product_id join colors on colors.product_id = products.id where skus.color_id = colors.id")    
  end

  def full_skus
    @full_skus ||= Sku.all(:select => 'distinct(skus.id), skus.*', :joins => "join offers on offers.shopping_event_id = #{id} join products on products.id = offers.product_id join colors on colors.product_id = products.id where skus.color_id = colors.id") 
  end

  def canceled?(now = Time.now)
    canceled_at && canceled_at <= now
  end


    def event_has_become_unpublishable?
    time_now = Time.now
    return (transitioning_from_publishable_to_unpublishable? && !has_ended?(time_now) && has_started_or_notified?(time_now))
  end

  def has_started_or_notified?(time_now = Time.now)
    has_started?(time_now) 
  end

  def duration_hrs
    true
  end

  def duration_mins
    true
  end
  
  def duration_hrs=(hrs)
    hrs
  end

  def duration_mins=(mins)
    mins
  end

  def canceled?(now = Time.now)
    !(canceled_at.nil? || canceled_at > now)
  end

  def has_not_started_and_wont_start_today?
    Time.now < start_at.beginning_of_day
  end
  
  def has_started_or_will_start_today?
    !has_not_started_and_wont_start_today?
  end

  def has_started?(for_time = Time.now)
    for_time >= start_at
  end

  def has_started_today?(today = Time.now)
    start_at >= today.beginning_of_day && start_at <= today.end_of_day
  end

  def has_ended?(for_time = Time.now)
    end_at <= for_time || canceled?(for_time)
  end
  
  def has_ended_more_than_hour_ago?
    has_ended?(1.hour.ago)
  end

  def is_on_now?(for_time = Time.now)
    has_started?(for_time) && !has_ended?(for_time)
  end

   def transitioning_from_publishable_to_unpublishable?
    !!(publishable_flag_was && !publishable_flag)
  end

  
end