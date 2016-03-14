require 'feedjira'

class Headline < ActiveRecord::Base
  FEED_URL = "https://news.ycombinator.com/rss"

  def self.fetch_entries
    feed = Feedjira::Feed.fetch_and_parse(FEED_URL)

    feed_entries = feed.entries.sort_by { |entry| entry.published}.reverse

    saved_headlines = Favorite.all.map { |x| x.title }

    entries = feed_entries.reduce([]) do |memo,entry|
      already_saved = saved_headlines.include?(entry.title)

      memo << {
          published:                entry.published,
          publication_date_time:    entry.published.to_s,

          title:                    entry.title,
          previously_saved:         already_saved ? "yes" : "no",

          url:                      entry.url,
          summary:                  entry.summary
      }
    end
  end

  # def self.saved_headlines
  #   saved_headlines = Favorite.all.map { |x| x.title }
  #   all_headlines = fetch_entries
  #
  #   already_saved = all_headlines.select { |x| saved_headlines.include? x[:title] }
  #   # binding.pry
  #   already_saved
  # end
end
