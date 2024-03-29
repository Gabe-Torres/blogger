require 'rails_helper'

RSpec.describe 'user sees all tags', type: :feature do
  describe 'they visit /tags' do
    scenario 'displays all tags' do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      article = user.articles.create!(title: "new", body: "neeeeewwww")
      tag = article.tags.create!(name: "lesssgo")
      article_2 = user.articles.create!(title: 'title 2', body: 'body 2')
      tag_2 = article_2.tags.create!(name: "not go")


      visit '/articles'

      expect(page).to have_link('All Tags')
      click_link('All Tags')

      expect(current_path).to eq(tags_path)
      expect(page).to have_content("lesssgo")
      expect(page).to have_content("not go")
    end
  end
end