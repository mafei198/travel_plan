# == Schema Information
# Schema version: 20110622093624
#
# Table name: profiles
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  image_url        :string(255)
#  image_url_small  :string(255)
#  image_url_medium :string(255)
#  birthday         :date
#  gender           :string(255)
#  user_id          :integer
#  location         :string(255)
#  url              :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Profile < ActiveRecord::Base
  belongs_to :user
end
