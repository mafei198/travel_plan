# == Schema Information
# Schema version: 20110517094558
#
# Table name: places
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Place < ActiveRecord::Base
  has_many :attractions
  has_many :hot_places

  has_many :plan_places
  has_many :plans, :through => :plan_place

end
