# == Schema Information
# Schema version: 20110517094558
#
# Table name: journeys
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  from_to     :string(255)
#  budget      :decimal(, )
#  type        :string(255)
#  type_id     :integer
#  schedule_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Journey < ActiveRecord::Base
  belongs_to :schedule
end
