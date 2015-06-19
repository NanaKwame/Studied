class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
