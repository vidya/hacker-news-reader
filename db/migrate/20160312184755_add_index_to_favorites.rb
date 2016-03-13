class AddIndexToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, :title, unique: true
    add_index :favorites, :url, unique: true
  end
end
