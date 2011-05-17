class CreatePlanAttractions < ActiveRecord::Migration
  def self.up
    create_table :plan_attractions do |t|
      t.integer :plan_id
      t.integer :attraction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :plan_attractions
  end
end
