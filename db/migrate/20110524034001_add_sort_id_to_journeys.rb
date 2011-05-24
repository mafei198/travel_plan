class AddSortIdToJourneys < ActiveRecord::Migration
  def self.up
    add_column :journeys, :sort_id, :integer
  end

  def self.down
    remove_column :journeys, :sort_id
  end
end
