module JourneysHelper
  def schedule_costs(schedule)
    schedule.journeys.inject(sum = 0){|sum,j|sum + j.budget.to_i}
  end
end
