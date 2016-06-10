atom_feed do |feed|
  feed.title('Articles index')

  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.content(article.body, type: 'html')
    end
  end
end