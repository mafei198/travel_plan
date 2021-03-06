# == Schema Information
# Schema version: 20110623094930
#
# Table name: plans
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  description     :text
#  start_off_place :string(255)
#  start_off_date  :date
#  people_num      :integer(4)
#  user_id         :integer(4)
#  travel_type_id  :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  order_list      :string(255)
#

class Plan < ActiveRecord::Base
  act_as_list :items => :schedules
  after_create :create_baggage_list
  validates :name, :length => {:in => 5..50}
  validates :people_num, :numericality => true

  #用于验证页面数据格式，因为页面数据格式为"DD,MM,YYYY",
  validates :start_off_date, :format => { :with => /\d\d\d\d-\d\d-\d\d/}
  #保存时格式为"Sat, 28 May 2011"

  has_many :plan_attractions, :dependent => :destroy
  has_many :attractions, :through => :plan_attractions

  has_many :plan_places, :dependent => :destroy
  has_many :places, :through => :plan_places

  has_many :schedules
  has_one  :baggage_list

  has_many :hot_plans
  has_many :recommend_plans

  belongs_to :user
  belongs_to :travel_type

  private
  def create_baggage_list
    BaggageList.create(:plan_id => id)
  end
end
