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

require 'lib/act_as_list'
class Schedule < ActiveRecord::Base
  include ActAsList
  act_as_list :mount => :plan

  has_many :journeys
  belongs_to :plan

  #return an array which is filled with ordered journeys.
  def ordered_journeys
    return [] if order_list_empty?

    order_array.collect do |order|
      journeys.each do |journey|
        if journey.id == order.to_i
          break journey
        end
      end
    end
  end

  def order_list_empty?
    order_list == nil or order_list == ',' or order_list == ''
  end

  def order_array
    order_list.split(',').delete_if{|e| e == '' }
  end

  private
  def add_schedule
    new_order_list = self.plan.order_list.to_s + ",#{id.to_s}"
    self.plan.update_attribute(:order_list,new_order_list)
  end

  def destroy_schedule
    new_order_list = (self.plan.order_list.split(',') - id.to_s.to_a).join(',')
    self.plan.update_attribute(:order_list,new_order_list)
  end

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
