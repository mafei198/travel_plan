class CreateTravelTypes < ActiveRecord::Migration
  def self.up
    create_table :travel_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :travel_types
  end
end
