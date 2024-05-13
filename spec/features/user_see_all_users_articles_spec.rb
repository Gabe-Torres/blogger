require 'rails_helper'

RSpec.describe 'user sees all other user articles', type: :feature do
  describe 'they visit /all_articles' do
    scenario 'displays all user articles' do
      user1 = User.create!(:email => 'test1@example.com', :password => 'f4k3p45')
      login_as(user1, :scope => :user)
      u1_article_1 = user1.articles.create!(title: 'title 1', body: 'body 1')
      u1_article_2 = user1.articles.create!(title: 'title 2', body: 'body 2')
      u1_article_3 = user1.articles.create!(title: 'title 3', body: 'body 3')

      user2 = User.create!(:email => 'test2@example.com', :password => 'f3p455w0rd')
      login_as(user2, :scope => :user)
      u2_article_1 = user2.articles.create!(title: 'title 1', body: 'body 1')
      u2_article_2 = user2.articles.create!(title: 'title 2', body: 'body 2')
      u2_article_3 = user2.articles.create!(title: 'title 3', body: 'body 3')

      user3 = User.create!(:email => 'test3@example.com', :password => 'f4k3pw0rd')
      login_as(user3, :scope => :user)
      u3_article_1 = user3.articles.create!(title: 'title 1', body: 'body 1')
      u3_article_2 = user3.articles.create!(title: 'title 2', body: 'body 2')
      u3_article_3 = user3.articles.create!(title: 'title 3', body: 'body 3')

      visit 'all_articles'

      expect(page).to have_content(u1_article_1.title)
      expect(page).to have_content(u1_article_2.title)
      expect(page).to have_content(u1_article_3.title)

      expect(page).to have_content(u2_article_1.title)
      expect(page).to have_content(u2_article_2.title)
      expect(page).to have_content(u2_article_3.title)

      expect(page).to have_content(u3_article_1.title)
      expect(page).to have_content(u3_article_2.title)
      expect(page).to have_content(u3_article_3.title)
    end
  end
end
