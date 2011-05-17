# == Schema Information
# Schema version: 20110517094558
#
# Table name: recommend_plans
#
#  id         :integer         not null, primary key
#  plan_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class RecommendPlan < ActiveRecord::Base
  belongs_to :plan
end
