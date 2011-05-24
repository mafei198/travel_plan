module NavigateById

  def NavigateById.included(mod)
    puts "#{self} included #{mod}"
    mod.scope :previous, lambda { |i| {:conditions => ["#{mod.table_name}.sort_id < ?", i.sort_id], :order => "#{mod.table_name}.sort_id DESC"} }
    mod.scope :next, lambda { |i| {:conditions => ["#{mod.table_name}.sort_id > ?", i.sort_id], :order => "#{mod.table_name}.sort_id ASC"} }

  end

end

module SetUpDown

  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do

    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods
    def set_up_down(model_name)
      action_name_to_command_name = {:up => :previous, :down => :next}
      [:up, :down].each do |action_name|
        define_method(action_name) do
          record = sort_command(action_name_to_command_name[action_name], model_name)
          redirect_to model_name == Schedule ? record.plan : record.schedules.plan
        end
      end
    end

  end # ClassMethods

  module InstanceMethods
    private
    def sort_command(command, model_name)
      record = model_name.find(params[:id])
      h = {:previous => :last, :next => :first}
      if (other_record = model_name.send(command, record).send(h[command])) != nil
        record.sort_id, other_record.sort_id = other_record.sort_id, record.sort_id
        record.save
        other_record.save
      end
      record
    end

  end # InstanceMethods

end
