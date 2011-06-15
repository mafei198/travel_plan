class CreateJourneys < ActiveRecord::Migration
  def self.up
    create_table :journeys do |t|
      t.string :name
      t.text :description
      t.string :from_to
      t.decimal :budget
      t.string :journey_type
      t.integer :schedule_id

      t.timestamps
    end
  end

  def self.down
    drop_table :journeys
  end
end
