# == Schema Information
# Schema version: 20110623094930
#
# Table name: places
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Place < ActiveRecord::Base
  has_many :attractions
  has_many :hot_places

  has_many :plan_places, :dependent => :destroy
  has_many :plans, :through => :plan_places

end
