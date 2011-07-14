module ApplicationHelper
  def schedule_costs(schedule)
    schedule.journeys.inject(sum = 0){|sum,j|sum + j.costs.to_i}
  end
end
