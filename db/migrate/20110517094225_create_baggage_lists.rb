class CreateBaggageLists < ActiveRecord::Migration
  def self.up
    create_table :baggage_lists do |t|
      t.integer :plan_id
      t.string :credentials, :default => ''
      t.string :paraphernalia, :default => ''
      t.string :clothes, :default => ''
      t.string :care_supplies, :default => ''
      t.string :tools, :default => ''
      t.string :camera_equipment, :default => ''
      t.string :outdoor_equipment, :default => ''
      t.string :foods, :default => ''
      t.string :medicines, :default => ''
      t.text :notation

      t.timestamps
    end
  end

  def self.down
    drop_table :baggage_lists
  end
end
