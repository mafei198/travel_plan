# == Schema Information
# Schema version: 20110517094558
#
# Table name: schedules
#
#  id         :integer         not null, primary key
#  plan_date  :date
#  plan_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Schedule < ActiveRecord::Base
  has_many :journeys
  belongs_to :plan

end
