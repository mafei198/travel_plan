# == Schema Information
# Schema version: 20110622081159
#
# Table name: photos
#
#  id                :integer         not null, primary key
#  user_id           :integer
#  remote_photo_path :string(255)
#  remote_photo_name :string(255)
#  image_url         :string(255)
#  processed_image   :string(255)
#  unprocessed_image :string(255)
#  random_string     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Photo < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :processed_image, ProcessedImageUploader
  mount_uploader :unprocessed_image, UnprocessedImageUploader

  belongs_to :user

  has_many :attraction_photos, :dependent => :destroy
  has_one  :attractions, :through => :attraction_photos

end
