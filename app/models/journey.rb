# == Schema Information
# Schema version: 20110623094930
#
# Table name: journeys
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  starts      :string(255)
#  ends        :string(255)
#  costs       :integer(10)
#  link_type   :string(255)
#  schedule_id :integer(4)
#  link_id     :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Journey < ActiveRecord::Base
  belongs_to :schedule
  act_as_items :mount => :schedule

  def self.link_types
    link_types = {'scenic' => '游玩', 'hotel' => '住宿', 'flight' => '航班', 
                     'train' => '列车','restaurant' => '美食', 'ent' => '娱乐',
                     'other' => '其他'}
  end

end
