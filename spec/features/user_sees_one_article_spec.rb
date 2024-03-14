require "rails_helper"

RSpec.describe "user sees one article", type: :feature do
  describe "they link from the articles index" do
    it "displays information for one article" do
      article = Article.create!(title: "New title", body: "new body")
      comment1 = article.comments.create(author_name: "dude", body: "yessssiirrrr")
      comment2 = article.comments.create(author_name: "dudie", body: "bruuuuuu")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment1.author_name)
      expect(page).to have_content(comment1.body)
      expect(page).to have_content(comment2.author_name)
      expect(page).to have_content(comment2.body)
    end
  end

  describe 'they  fill in a comment form' do
    it 'displays the comment on the article show' do 
      article = Article.create!(title: "New title", body: "new body")

      visit article_path(article)

      fill_in "Author Name", with: "bruuuuu"
      fill_in 'Body', with: 'yesssssiiiiiirrrr'
      click_on 'Submit'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("bruuuuu")
      expect(page).to have_content("yesssssiiiiiirrrr")
    end
  end
end