class DropHeadlines < ActiveRecord::Migration
  def change
    drop_table :headlines
  end
end
