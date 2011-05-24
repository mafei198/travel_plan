# == Schema Information
# Schema version: 20110517094558
#
# Table name: journeys
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  from_to     :string(255)
#  budget      :decimal(, )
#  type        :string(255)
#  type_id     :integer
#  schedule_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
require 'lib/navigate_by_id'
class Journey < ActiveRecord::Base
  after_create :set_sort_id
  belongs_to :schedule
  default_scope :order => 'journeys.sort_id ASC'

  #Schedule.previous(instance_schedule),return previous record--smaller id's record
  #Schedule.next(instance_schedule),return next record--bigger id's record
  include NavigateById

  private
    def set_sort_id
      update_attribute(:sort_id,id)
    end
end
