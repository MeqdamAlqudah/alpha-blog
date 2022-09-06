class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[index show]
  def show; end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.create(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to article_path(@article.id)
    end
  end

  def update
    if @article.user == current_user && @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    end
  end

  def destroy
    @article.destroy if @article.user == current_user
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
