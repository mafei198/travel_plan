class CreateHotPlans < ActiveRecord::Migration
  def self.up
    create_table :hot_plans do |t|
      t.integer :plan_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hot_plans
  end
end
