class CreateTagLinks < ActiveRecord::Migration
  def change
    create_table :tag_links do |t|
      t.integer :tag_id
      t.integer :book_id
      t.timestamps
    end
  end
end
