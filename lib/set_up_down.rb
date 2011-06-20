module SetUpDown

  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do

    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods
    def set_up_down(model, order_list_model)
      [:up, :down].each do |action_name|
        define_method(action_name) do
          record = model.find(params[:id])
          order_list_model = record.send(order_list_model.to_sym)
          order_array = order_list_model.order_list.to_s.split(',')
          order_array.each_with_index do |order, i|
            case action_name
            when :up
              if_condition = (order == record.id.to_s && i != 0)
              elsif_condition = (order == record.id.to_s && i == 0)
              swap_i = i - 1
              action_error = "已经排在第一个了!"
            when :down
              if_condition = ((order == record.id.to_s) && (i != (order_array.size - 1)))
              elsif_condition = ((order == record.id.to_s) && (i == (order_array.size - 1)))
              swap_i = i + 1
              action_error = "已经排在最后一个了!"
            end

            if if_condition
              order_array[i], order_array[swap_i] = order_array[swap_i], order_array[i]
              if order_list_model.update_attribute(:order_list, order_array.join(','))
                render :json => {"success" => true, "swapid" => order_array[i]}
              else
                render :json => {"success" => false, "error" => "服务器忙请稍后再试!"}
              end
              break
            elsif elsif_condition
              render :json => {"success" => false, "error" => action_error}
            end
          end
        end
      end
    end
  end

    module InstanceMethods

    end # InstanceMethods

  end
