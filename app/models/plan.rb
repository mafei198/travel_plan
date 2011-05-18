# == Schema Information
# Schema version: 20110517094558
#
# Table name: plans
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  description     :text
#  start_off_place :string(255)
#  start_off_date  :date
#  people_num      :integer
#  user_id         :integer
#  travel_type_id  :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Plan < ActiveRecord::Base
  has_many :plan_attractions, :dependent => :destroy
  has_many :attractions, :through => :plan_attractions

  has_many :plan_places, :dependent => :destroy
  has_many :places, :through => :plan_places

  has_many :schedules
  has_many :baggage_lists
  has_many :hot_plans
  has_many :recommend_plans

  belongs_to :user
  belongs_to :travel_type
end
