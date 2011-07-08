# == Schema Information
# Schema version: 20110623094930
#
# Table name: hot_places
#
#  id         :integer(4)      not null, primary key
#  place_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class HotPlace < ActiveRecord::Base
end
