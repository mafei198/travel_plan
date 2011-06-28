# == Schema Information
# Schema version: 20110517094558
#
# Table name: baggage_lists
#
#  id         :integer         not null, primary key
#  plan_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class BaggageList < ActiveRecord::Base
  belongs_to :plan

  def luggage
    {:credentials => '相关证件', :paraphernalia => '旅行随身', :clothes => '换洗衣物',
     :care_supplies => '护理用品', :tools => '随行工具', :camera_equipment => '摄影器材',
     :outdoor_equipment => '户外装备', :foods => '休闲食品', :medicines => '常备药品'}
  end

  def baggage_list_empty?
    credentials == '' && paraphernalia == '' && clothes == '' && care_supplies == '' && tools && camera_equipment == '' && outdoor_equipment == '' && foods == '' && medicines == ''
  end
end
