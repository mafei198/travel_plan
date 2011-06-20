module PlansHelper
  def order_schedule(plan)
    return [] if plan.order_list == nil
    order_array = plan.order_list.split(',')
    order_array.collect do |order| 
      plan.schedules.each do |schedule| 
        if schedule.id == order.to_i
          break schedule
        end
      end
    end
  end

  def order_journey(schedule)
    return [] if schedule.order_list == nil
    order_array = schedule.order_list.split(',')
    order_array.collect! do |order| 
      schedule.journeys.each do |journey| 
        puts "journey.id=#{journey.id}; order.to_i=#{order.to_i}"
        if journey.id == order.to_i
          break journey
        end
      end
    end
  end
end
