class ShoppingEventGroup < ActiveRecord::Base
  include Ideeli::Publishable
  has_many :shopping_events, :foreign_key => 'group_id', :dependent => :nullify

  def publishable_with_caching?
    return false if shopping_events.empty?
    shopping_events.all? { |e| e.publishable?}
  end

  def check_publishing_rules
    logger.info "PR: Checking if shopping events exists"
    publishing_errors.add(:base, 'No shopping events assigned to this group') if shopping_events.length.zero?
    logger.info "PR: Checking if shopping_events are publishable"
    publishing_errors.add(:base, 'One or more shopping events are unpublishable') unless shopping_events.select {|s| !s.publishable? }.all?(&:publishable_without_caching?)
  end

  def after_save
    shopping_events.each do |event|
      event.start_at = start_at
      event.end_at = end_at if use_group_end_at?
      event.save!
    end
  end
end