class AddSortIdToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :sort_id, :integer
  end

  def self.down
    remove_column :schedules, :sort_id
  end
end
