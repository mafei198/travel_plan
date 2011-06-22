class CreateAttractionPhotos < ActiveRecord::Migration
  def self.up
    create_table :attraction_photos do |t|
      t.integer :attraction_id
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attraction_photos
  end
end
