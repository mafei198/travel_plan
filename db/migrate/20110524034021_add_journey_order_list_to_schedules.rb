class AddJourneyOrderListToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :journey_order_list, :string
  end

  def self.down
    remove_column :schedules, :journey_order_list
  end
end
