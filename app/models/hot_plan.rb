# == Schema Information
# Schema version: 20110623094930
#
# Table name: hot_plans
#
#  id         :integer(4)      not null, primary key
#  plan_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class HotPlan < ActiveRecord::Base
  belongs_to :plan
end
