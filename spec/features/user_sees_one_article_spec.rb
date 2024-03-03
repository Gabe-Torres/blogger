require "rails_helper"

RSpec.describe "user sees one article", type: :feature do
  describe "they link from the articles index" do
    it "displays information for one article" do
      article = Article.create!(title: "New title", body: "new body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end