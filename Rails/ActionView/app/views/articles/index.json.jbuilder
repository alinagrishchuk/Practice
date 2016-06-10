json.array!(@articles) do |article|
  json.extract! article, :id, :body
  json.name ("Sample name for try")
  json.url article_url(article, format: :json)
end
