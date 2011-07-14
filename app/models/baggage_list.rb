# == Schema Information
# Schema version: 20110623094930
#
# Table name: baggage_lists
#
#  id                :integer(4)      not null, primary key
#  plan_id           :integer(4)
#  credentials       :string(255)     default("")
#  paraphernalia     :string(255)     default("")
#  clothes           :string(255)     default("")
#  care_supplies     :string(255)     default("")
#  tools             :string(255)     default("")
#  camera_equipment  :string(255)     default("")
#  outdoor_equipment :string(255)     default("")
#  foods             :string(255)     default("")
#  medicines         :string(255)     default("")
#  notation          :text
#  created_at        :datetime
#  updated_at        :datetime
#

class BaggageList < ActiveRecord::Base
  belongs_to :plan

  def luggage
    {:credentials => '相关证件', :paraphernalia => '旅行随身', :clothes => '换洗衣物',
     :care_supplies => '护理用品', :tools => '随行工具', :camera_equipment => '摄影器材',
     :outdoor_equipment => '户外装备', :foods => '休闲食品', :medicines => '常备药品'}
  end

  def baggage_list_empty?
    checked_items == nil or checked_items == ''
  end
end
