class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.date :plan_date
      t.integer :plan_id

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
