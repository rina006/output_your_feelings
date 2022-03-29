class ArticlesController < ApplicationController
  def index
    @articles = Article.all.includes(:user).order(created_ar: :desc)
  end
end
