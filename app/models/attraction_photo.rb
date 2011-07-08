# == Schema Information
# Schema version: 20110623094930
#
# Table name: attraction_photos
#
#  id            :integer(4)      not null, primary key
#  attraction_id :integer(4)
#  photo_id      :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class AttractionPhoto < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :photo
end
