# == Schema Information
# Schema version: 20110623094930
#
# Table name: plan_places
#
#  id         :integer(4)      not null, primary key
#  plan_id    :integer(4)
#  place_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class PlanPlace < ActiveRecord::Base
  belongs_to :plan
  belongs_to :place

end
