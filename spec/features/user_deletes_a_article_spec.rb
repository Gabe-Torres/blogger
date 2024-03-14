require "rails_helper"

RSpec.describe "user deletes a article", type: :feature do
  describe "they link from the show page" do
    it "displays index of all articles without the deleted article" do
      article1 = Article.create!(title: "New title", body: "new body")
      article2 = Article.create!(title: "New", body: "body")

      visit article_path(article1)

      click_link "Delete"

      expect(current_path).to eq(articles_path)

      expect(page).to_not have_content(article1.title)
      expect(page).to have_content(article2.title)
      expect(page).to have_content("Article deleted!")
    end
  end
end