# == Schema Information
# Schema version: 20110517094558
#
# Table name: travel_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TravelType < ActiveRecord::Base
  has_many :plans
end
