# == Schema Information
# Schema version: 20110517094558
#
# Table name: hot_places
#
#  id         :integer         not null, primary key
#  place_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class HotPlace < ActiveRecord::Base
end
