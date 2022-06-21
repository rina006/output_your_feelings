class ArticlesController < ApplicationController
  def index
    @articles = Article.where(user_id: current_user.id).includes(:user).order("created_at DESC").page(params[:page])
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

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, success: t('defaults.message.updated', item: Article.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Article.model_name.human)
      render :edit
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy!
    redirect_to articles_path, success: t('defaults.message.deleted', item: Article.model_name.human)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
