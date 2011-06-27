class CreateJourneys < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
      t.string :name
      t.text :description
      t.string :starts
      t.string :ends
      t.decimal :costs
      t.string :link_type
      t.integer :schedule_id
      t.integer :link_id

      t.timestamps
    end
  end

  def self.down
    drop_table :journeys
  end
end
