# == Schema Information
# Schema version: 20110517094558
#
# Table name: plan_places
#
#  id         :integer         not null, primary key
#  plan_id    :integer
#  place_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class PlanPlace < ActiveRecord::Base
  belongs_to :plan
  belongs_to :place

end
