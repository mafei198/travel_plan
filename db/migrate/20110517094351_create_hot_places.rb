class CreateHotPlaces < ActiveRecord::Migration
  def self.up
    create_table :hot_places do |t|
      t.integer :place_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hot_places
  end
end
