class CreatePlanPlaces < ActiveRecord::Migration
  def self.up
    create_table :plan_places do |t|
      t.integer :plan_id
      t.integer :place_id

      t.timestamps
    end
  end

  def self.down
    drop_table :plan_places
  end
end
