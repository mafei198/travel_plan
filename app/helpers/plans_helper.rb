module PlansHelper
  def order_schedule(plan)
    return [] if plan.schedule_order_list == nil
    order_array = plan.schedule_order_list.split(',')
    order_array.collect do |order| 
      plan.schedules.each do |schedule| 
        if schedule.id == order.to_i
          break schedule
        end
      end
    end
  end

  def order_journey(schedule)
    return [] if schedule.journey_order_list == nil
    order_array = schedule.journey_order_list.split(',')
    order_array.collect do |order| 
      schedule.journeys.each do |journey| 
        if journey.id == order.to_i
          break journey
        end
      end
    end
  end
end
