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
  attr_accessor :valid_date

  validates :name, :length => {:in => 5..50}
  validates :people_num, :numericality => true

  #用于验证页面数据格式，因为页面数据格式为"DD,MM,YYYY",
  validates :valid_date, :format => { :with => /\d\d\/\d\d\/\d\d\d\d/}
  #保存时格式为"Sat, 28 May 2011"
  validates :start_off_date, :presence => true

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
