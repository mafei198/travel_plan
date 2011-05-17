class CreateBaggageLists < ActiveRecord::Migration
  def self.up
    create_table :baggage_lists do |t|
      t.integer :plan_id

      t.timestamps
    end
  end

  def self.down
    drop_table :baggage_lists
  end
end
