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

class Schedule < ActiveRecord::Base
  after_create :set_sort_id

  has_many :journeys
  belongs_to :plan
  default_scope :order => 'schedules.sort_id ASC'

  def set_sort_id
    update_attribute(:sort_id,id)
  end
end
