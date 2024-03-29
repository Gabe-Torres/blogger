require 'rails_helper'

RSpec.describe 'user can delete a tag', type: :feature do
  describe 'they visit an article' do
    scenario 'they click a tag and delete it' do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      article = Article.create!(user: user, title: "new", body: "neeeeewwww")
      tag = article.tags.create!(name: "lesssgo")
      article_2 = Article.create!(user: user, title: 'title 2', body: 'body 2')
      tag_2 = article_2.tags.create!(name: "not go")


      visit article_path(article)

      click_link "lesssgo"

      expect(current_path).to eq(tag_path(tag))

      expect(page).to have_content("lesssgo")

      click_on "Delete"

      expect(page).to_not have_content(tag.name)
    end
  end
end