# == Schema Information
# Schema version: 20110526015814
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
#  place_id    :integer
#

class Attraction < ActiveRecord::Base
  has_many :plan_attractions, :dependent => :destroy
  has_many :plans, :through => :plan_attractions

  belongs_to :place

  scope :get_attractions_by, lambda{|place| attractions_belongs_to(place)}

  private
  def self.attractions_belongs_to(place)
    where("place_id = :place_id", {:place_id => place})
  end

end
