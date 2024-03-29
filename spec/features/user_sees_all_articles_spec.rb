require 'rails_helper'

RSpec.describe 'user sees all article', type: :feature do
  describe 'they visit /articles' do
    scenario 'displays all articles' do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      article_1 = user.articles.create!(title: 'title 1', body: 'body 1')
      article_2 = user.articles.create!(title: 'title 2', body: 'body 2')

      visit '/articles'

      expect(page).to have_link(article_1.title)
      expect(page).to have_link(article_2.title)

      expect(page).to have_link('New Article')
    end
  end
end