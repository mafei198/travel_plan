class AddPlaceIdToAttractions < ActiveRecord::Migration
  def self.up
    add_column :attractions, :place_id, :integer
  end

  def self.down
    remove_column :attractions, :place_id
  end
end
