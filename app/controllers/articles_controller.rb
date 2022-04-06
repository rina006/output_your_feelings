class ArticlesController < ApplicationController
  def index
    @articles = Article.all.includes(:user).order(created_at: :desc)
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path, success: t('defaults.message.created', item: Article.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Article.model_name.human)
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
