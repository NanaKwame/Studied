class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :description
      t.timestamps
    end
  end
end
