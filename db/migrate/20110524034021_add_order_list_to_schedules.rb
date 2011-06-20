class AddOrderListToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :order_list, :string
  end

  def self.down
    remove_column :schedules, :order_list
  end
end
