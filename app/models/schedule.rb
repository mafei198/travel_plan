# == Schema Information
# Schema version: 20110526015814
#
# Table name: schedules
#
#  id                 :integer         not null, primary key
#  plan_date          :date
#  plan_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  name               :string(255)
#  description        :text
#  journey_order_list :string(255)
#

class Schedule < ActiveRecord::Base
  after_create :add_schedule
  after_destroy :destroy_schedule

  has_many :journeys
  belongs_to :plan

  private
  def add_schedule
    new_order_list = self.plan.order_list.to_s + "#{id.to_s},"
    self.plan.update_attribute(:order_list,new_order_list)
  end
  def destroy_schedule
    new_order_list = (self.plan.order_list.split(',') - id.to_s.to_a).join(',') + ','
    self.plan.update_attribute(:order_list,new_order_list)
  end
end
