require 'rails_helper'

RSpec.describe 'user creates new article', type: :feature do
  describe 'they link from the article index' do
    describe 'they fill in the form' do
      it 'creates a new article' do
        visit articles_path

        click_link 'New Article'

        expect(current_path).to eq(new_article_path)

        fill_in 'Title', with: 'new title'
        fill_in 'Body', with: 'new body'

        click_on 'Create Article'

        expect(page).to have_content('new title')
        expect(page).to have_content('new body')
        expect(page).to have_content('Article created!')

      end
    end
  end
end
