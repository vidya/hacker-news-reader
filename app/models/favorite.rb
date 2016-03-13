class Favorite < ActiveRecord::Base
  validates :publication_date, presence: true
  validates :title, uniqueness: true
  validates :url, uniqueness: true
end
