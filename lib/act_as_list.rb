module ActAsList

  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do
      after_create  :add_item_to_list
      after_destroy :delete_item_from_list
    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods
    def act_as_list(options = {})
      raise "Exceptions from act_as_list, you must figure out which model to mount.\n i.e \n act_as_list :mount => :xxx" if options[:mount] == nil
      class_eval do
        after_create  :add_item_to_list
        after_destroy :delete_item_from_list

        private
        def add_item_to_list
          new_list = send(options[:mount]).list.to_s + ",#{id.to_s}"
          update_list_with new_list
        end

        def delete_item_from_list
          new_list = (send(options[:mount]).list.split(',') - id.to_s.to_a).join(',')
          update_list_with new_list
        end

        def update_list_with(new_list = '')
          return if new_list == ''
          options[:mount].update_attribute(:list, new_list)
        end
      end
    end

  end # ClassMethods

  module InstanceMethods

  end # InstanceMethods

end
