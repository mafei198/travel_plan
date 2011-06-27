class CreateAttractions < ActiveRecord::Migration
  def self.up
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.string :starts
      t.string :ends
      t.string :address
      t.decimal :costs

      t.timestamps
    end
  end

  def self.down
    drop_table :attractions
  end
end
