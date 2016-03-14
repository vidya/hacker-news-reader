class ChangePublishedInHeadlines < ActiveRecord::Migration
  def change
    change_column :headlines, :published,  :datetime
  end
end
