# == Schema Information
# Schema version: 20110623094930
#
# Table name: schedules
#
#  id          :integer(4)      not null, primary key
#  plan_date   :date
#  plan_id     :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  description :text
#  order_list  :string(255)
#

class Schedule < ActiveRecord::Base
  act_as_list :items => :journeys
  act_as_items :mount => :plan

  has_many :journeys
  belongs_to :plan

  private
  def destroy_plan_attractions
    PlanAttraction.destroy(plan_attraction_ids)
  end

  def plan_attraction_ids
    attraction_ids = []
    journeys.each do |journey|
      if journey.link_type == 'scenic'
        attraction_ids << journey.link_id
      end
    end
    plan_attractions = PlanAttraction.find_by_sql ["SELECT id FROM plan_attractions WHERE attraction_id IN (?)", attraction_ids]
    plan_attractions.collect{|e| e.id }
  end
end
