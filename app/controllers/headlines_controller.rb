
class HeadlinesController < ApplicationController
  def index
    # read the RSS feed and flag previously saved entries
    @entries = Headline.fetch_entries

    # set the feed fetch time for display on the headlines page
    @last_refresh_time = Time.now.strftime('%c')
  end
end
