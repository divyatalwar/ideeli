class Product < ActiveRecord::Base
  include Ideeli::Publishable


   has_many :colors, :class_name => "IdeeliColor"#, :conditions => ['colors.deleted = 0'], :dependent => :nullify
  # has_many :deleted_colors, :class_name => "IdeeliColor", :conditions => ['colors.deleted = 1'], :dependent => :nullify
  has_many :offers
  has_many :shopping_events, :through => :offers
  has_many :unordered_skus, :through => :colors, :source => :skus
  belongs_to :info, :class_name => "ProductInfo", :foreign_key => "info_id"
  # before_create :updateate_info
  after_save :validate_publishing_chain
  delegate :spec, to: :info


  def notify_publishability_change!(first_link = true)
    self.publishable_flag = publishable_without_caching?
    if first_link 
      ActiveRecord::Base.connection.execute("update product_infos set publishable_flag = #{publishable_flag} where id = #{info_id}")
    end

    notify_publishability_upchain!
  end


  def check_publishing_rules
    publishing_errors.add(:strapline, 'must be set') if strapline.blank?
    publishing_errors.add(:brand_name, 'must be set') if brand_name.blank?    
    publishing_errors.add(:spec, 'must be set') if spec.blank?
    logger.info "PR : P : Checking if colors exists"
    publishing_errors.add(:base, 'Must have at least one color') if colors.length.zero?
    logger.info "PR : P : Checking if any color is unpublishable"
    publishing_errors.add(:base,'One or more colors are unpublishable') if colors.any? {|x| !x.publishable_without_caching? }
  end

  def notify_publishability_upchain!

    offers.each do |o|  logger.warn 'UPCHAIN: Offer : #{o.id}'; o.notify_publishability_change! end
  end


  # def update_info
  #   if info && info.changes.any?
  #     info.save
  #   end
  # end

end