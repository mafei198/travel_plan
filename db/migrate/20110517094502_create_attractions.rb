class CreateAttractions < ActiveRecord::Migration
  def self.up
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.string :opentime
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :attractions
  end
end
