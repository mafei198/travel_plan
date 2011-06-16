class AddScheduleOrderListToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :schedule_order_list, :string
  end

  def self.down
    remove_column :plans, :schedule_order_list
  end
end
