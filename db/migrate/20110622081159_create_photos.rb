class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :user_id
      t.string  :remote_photo_path
      t.string  :remote_photo_name
      t.string  :image_url
      t.string  :processed_image
      t.string  :unprocessed_image
      t.string  :random_string

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
