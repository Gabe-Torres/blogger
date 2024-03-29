require 'rails_helper'

RSpec.describe 'user creates new article', type: :feature do
  describe 'they link from the article index' do
    describe 'they fill in the form' do
      it 'creates a new article' do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        login_as(user, :scope => :user)

        visit articles_path

        click_link 'New Article'

        expect(current_path).to eq(new_article_path)

        fill_in 'Title', with: 'new title'
        fill_in 'Body', with: 'new body'
        fill_in "article[tag_list]", with: "ruby technology"

        click_on 'Create Article'

        expect(page).to have_content('new title')
        expect(page).to have_content('new body')
        expect(page).to have_content('Article created!')
        expect(page).to have_content('ruby technology')
      end
    end
  end
end
