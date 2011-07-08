# == Schema Information
# Schema version: 20110623094930
#
# Table name: plan_attractions
#
#  id            :integer(4)      not null, primary key
#  plan_id       :integer(4)
#  attraction_id :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class PlanAttraction < ActiveRecord::Base
  belongs_to :plan
  belongs_to :attraction

end
