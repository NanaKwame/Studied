class ChangeColumnDefaultLibraries < ActiveRecord::Migration
  def change
  	change_column :libraries, :description, :text, :default => "unread"
  end
end
