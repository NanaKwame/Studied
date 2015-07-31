class CreateReferencedbooks < ActiveRecord::Migration
  def change
    create_table :referencedbooks do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :forum_id
      t.timestamps
    end
  end
end
