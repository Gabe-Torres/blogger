class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[show destroy edit update]

  def index
    @articles = current_user.articles
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @user = current_user

    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash.notice = 'Article created!'
      redirect_to article_path(@article)
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
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
