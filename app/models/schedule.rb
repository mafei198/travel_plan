# == Schema Information
# Schema version: 20110523063153
#
# Table name: schedules
#
#  id          :integer         not null, primary key
#  plan_date   :date
#  plan_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  description :text
#

require 'lib/navigate_by_id'
class Schedule < ActiveRecord::Base
  after_create :set_sort_id

  has_many :journeys
  belongs_to :plan
  default_scope :order => 'schedules.sort_id ASC'

  #Schedule.previous(instance_schedule),return previous record--smaller id's record
  #Schedule.next(instance_schedule),return next record--bigger id's record
  include NavigateById

  def set_sort_id
    update_attribute(:sort_id,id)
  end
end
