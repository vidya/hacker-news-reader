json.array!(@headlines) do |headline|
  json.extract! headline, :id, :title, :url, :published, :summary
  json.url headline_url(headline, format: :json)
end
