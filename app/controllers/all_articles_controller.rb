class AllArticlesController < ApplicationController
  def index
    @articles = Article.all_with_users
  end
end
