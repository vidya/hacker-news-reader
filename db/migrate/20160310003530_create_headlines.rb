class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.string :title
      t.string :url
      t.date :published
      t.string :summary

      t.timestamps null: false
    end
  end
end
