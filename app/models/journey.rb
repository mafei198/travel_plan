# == Schema Information
# Schema version: 20110526015814
#
# Table name: journeys
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  from_to      :string(255)
#  budget       :decimal(, )
#  journey_type :string(255)
#  schedule_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Journey < ActiveRecord::Base
  after_create :set_sort_id
  belongs_to :schedule
  default_scope :order => 'journeys.sort_id ASC'

  def self.journey_types
    journey_types = {'scenic' => '游玩', 'hotel' => '住宿', 'flight' => '航班', 
                     'train' => '列车','restaurant' => '美食', 'ent' => '娱乐',
                     'other' => '其他'}
  end
  private
  def set_sort_id
    update_attribute(:sort_id,id)
  end
end
