require 'rails_helper'

RSpec.describe 'user sees a single tag', type: :feature do
  describe 'they link from the article show' do
    describe 'the tag name is displayed' do
      it 'tag show' do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        login_as(user, :scope => :user)
        article = user.articles.create!(title: "new", body: "neeeeewwww")
        tag = article.tags.create!(name: "lesssgo")

        visit article_path(article)

        click_link "lesssgo"

        expect(current_path).to eq(tag_path(tag))

        expect(page).to have_content("lesssgo")
      end
    end
  end
end
