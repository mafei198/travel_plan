# == Schema Information
# Schema version: 20110623094930
#
# Table name: recommend_plans
#
#  id         :integer(4)      not null, primary key
#  plan_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class RecommendPlan < ActiveRecord::Base
  belongs_to :plan
end
