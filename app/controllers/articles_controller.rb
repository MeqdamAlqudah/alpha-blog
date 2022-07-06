class ArticlesController < ApplicationController
  helper_method :current_user
  before_action :set_article, only: %i[show update destroy edit]
  before_action :article_params, only: %i[create update]
  def index
    @articles = Article.all
    @user = current_user
  end

  def new
    @article = Article.new
  end

  def show; end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to user_article_path(user_id: params[:user_id], id: @article.id)
    else
      # redirect_to new_user_article_path(user_id: params[:user_id])
      # render html: { 'errors' => @article.errors.full_messages }
      render :new, status: :unprocessable_entity end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to user_article_path(user_id: params[:user_id], id: @article.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article was deleted successfully.'
      redirect_to user_articles_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit; end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
