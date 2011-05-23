module NavigateById

  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do

    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods
    def previous(record)
      where("id < ?", record.id).limit(1).order("id asc").first
    end
    def next(record)
      where("id > ?", record.id).limit(1).order("id asc").first
    end


  end # ClassMethods

  module InstanceMethods

  end # InstanceMethods

  
end
module SetUpDown

  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do

    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods
    def set_up_down(model, jump_to)
      method_map = { :up => :previous, :down => :next}
      [:up, :down].each do |name|
        define_method(name) do
          record = model.find(params[:id])
          if (other_record = model.send(method_map[name], record)) != nil
            puts":::::::::::::::::before:#{record.id}:#{record},#{other_record.id}:#{other_record}"
            record.id, other_record.id = other_record.id, record.id
            puts":::::::::::::::::after:#{record.id}:#{record},#{other_record.id}:#{other_record}"
            puts record.save!
            puts other_record.save!
          end
          redirect_to record.plan
        end
      end
    end

  end # ClassMethods

  module InstanceMethods

  end # InstanceMethods

end
