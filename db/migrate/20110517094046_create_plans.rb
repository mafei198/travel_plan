class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.string :start_off_place
      t.date :start_off_date
      t.integer :people_num
      t.integer :user_id
      t.integer :travel_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
