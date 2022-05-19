class Api::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: { articles: articles }
  end

    def show
    article = Article.find(params['id'])
    response = serialize_comments(article)
    binding.pry
    render json: { article: response }
  rescue StandardError
    render json: { error: 'No such article exists' }, status: 422
  end

  private

  def serialize_comments(article)
    response = article.as_json
    response[:comment] = artcile.comment.as_json
    response
  end
end