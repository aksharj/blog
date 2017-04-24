class ArticleHighlighter
  @queue = :snippets_queue
  def self.perform(id)
    article = Article.find(id)
    article.update_attribute(:description, article.description)
  end
end