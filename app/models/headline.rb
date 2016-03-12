require 'feedjira'

class Headline < ActiveRecord::Base
  FEED_URL = "https://news.ycombinator.com/rss"

  def self.fetch_entries
    feed = Feedjira::Feed.fetch_and_parse(FEED_URL)

    feed_entries = feed.entries.sort_by { |entry| entry.published}.reverse

    entries = feed_entries.reduce([]) do |memo,entry|
      memo << {
          published:    entry.published,
          title:        entry.title,
          url:          entry.url,
          summary:      entry.summary
      }
    end
  end
end
