class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.string :image_url
      t.string :image_url_small
      t.string :image_url_medium
      t.date :birthday
      t.string :gender
      t.integer :user_id
      t.string :location
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
