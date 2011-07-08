# == Schema Information
# Schema version: 20110623094930
#
# Table name: attractions
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  starts      :string(255)
#  ends        :string(255)
#  address     :string(255)
#  costs       :integer(10)
#  created_at  :datetime
#  updated_at  :datetime
#  place_id    :integer(4)
#

class Attraction < ActiveRecord::Base
  has_many :plan_attractions, :dependent => :destroy
  has_many :plans, :through => :plan_attractions

  has_many :attraction_photos, :dependent => :destroy
  has_many :photos, :through => :attraction_photos

  belongs_to :place

  scope :get_attractions_by, lambda{|place| attractions_belongs_to(place)}

  private
  def self.attractions_belongs_to(place)
    where("place_id = :place_id", {:place_id => place})
  end

end
