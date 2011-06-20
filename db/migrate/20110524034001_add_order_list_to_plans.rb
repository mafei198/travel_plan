class AddOrderListToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :order_list, :string
  end

  def self.down
    remove_column :plans, :order_list
  end
end
