class CreateRecommendPlans < ActiveRecord::Migration
  def self.up
    create_table :recommend_plans do |t|
      t.integer :plan_id

      t.timestamps
    end
  end

  def self.down
    drop_table :recommend_plans
  end
end
