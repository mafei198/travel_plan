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
end
