module Ideeli
  module Publishable
    def notify_publishability_change!(first_link = true)
      reload unless first_link # need reload to refresh state of up-the-chain object

      write_attribute(:publishable_flag, publishable_without_caching?)

      if first_link  # save on first link: can't use save() due to callback
        connection.execute("update #{self.class.table_name} set publishable_flag = #{publishable_flag} where id = #{id}")
        if self.is_a?(ShoppingEvent) && self.event_has_become_unpublishable?
          logger.info "AdminNotification: event become unpublishable id##{id}"
          # AdminMailer.deliver_event_become_unpublishable(self)
        end
      else
        # vinsol: we din't find any case where this else branch is being called
        save  # save for up-chain objects
      end
      notify_publishability_upchain! if respond_to?(:notify_publishability_upchain!)
    end
    
    def publishing_errors
      @publishing_errors ||= ActiveModel::Errors.new(self)
    end

    def publishable?
      publishable_flag.nil? ? publishable_without_caching? : publishable_flag
    end

    def publishable_without_caching?
      check_publishability().empty?
    end

    def check_publishability
      publishing_errors.clear
      check_publishing_rules
      publishing_errors
    end

    # included class can defined method notify_publishability_upchain!()
    # to define additional notification chain and must define method
    # check_publishing_rules() that add to publishing_errors
    def check_publishing_rules
      raise Exception.new("check_publishing_rules needs to be redefined by including class: #{self.class}")
    end

    # validation: trigger by calling enforce_publishing_validation! on model
    def enforce_publishing_validation!
      @enforce_publishing_validation = true
    end

    def validate_publishing_chain
      if @enforce_publishing_validation
        notify_publishability_change!(true)
      end
    end
  end
end
