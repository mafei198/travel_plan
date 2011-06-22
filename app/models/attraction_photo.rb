# == Schema Information
# Schema version: 20110622094539
#
# Table name: attraction_photos
#
#  id            :integer         not null, primary key
#  attraction_id :integer
#  photo_id      :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class AttractionPhoto < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :photo
end
