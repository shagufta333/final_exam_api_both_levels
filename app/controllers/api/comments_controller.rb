class Api::CommentsController < ApplicationController
  before_action :find_article

  def create
    # comment = Comment.create(body: params[:body], article_id: params[:article_id])
    comment = @article.comments.create(body: params[:body])
    render json: { comment: comment }, status: 201
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end
end
