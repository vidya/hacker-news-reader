class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :url
      t.datetime :publication_date

      t.timestamps null: false
    end
  end
end
