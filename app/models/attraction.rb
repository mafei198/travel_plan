# == Schema Information
# Schema version: 20110517094558
#
# Table name: attractions
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  opentime    :string(255)
#  address     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Attraction < ActiveRecord::Base
  has_many :plan_attractions, :dependent => :destroy
  has_many :plans, :through => :plan_attractions

  belongs_to :place
end
