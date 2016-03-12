module HeadlinesHelper
  def get_link_str(entry)
    link_str = "/favorite/save?title=#{entry[:title]}&url=#{entry[:url]}"
    link_str += "&publication_date=#{entry[:published]}"
  end
end
