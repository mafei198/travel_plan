# == Schema Information
# Schema version: 20110517094558
#
# Table name: plan_attractions
#
#  id            :integer         not null, primary key
#  plan_id       :integer
#  attraction_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class PlanAttraction < ActiveRecord::Base
  belongs_to :plan
  belongs_to :attraction

end
