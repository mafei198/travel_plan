# == Schema Information
# Schema version: 20110517094558
#
# Table name: hot_plans
#
#  id         :integer         not null, primary key
#  plan_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class HotPlan < ActiveRecord::Base
  belongs_to :plan
end
