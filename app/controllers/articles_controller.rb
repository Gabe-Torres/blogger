class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show destroy edit update]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create!(article_params)

    flash.notice = 'Article created!'

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    flash.notice = 'Article deleted!'

    redirect_to articles_path
  end

  def edit; end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated!"

    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, images: [])
  end
end
