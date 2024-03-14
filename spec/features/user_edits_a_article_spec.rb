require 'rails_helper'

RSpec.describe 'user edits one article', type: :feature do
  describe 'they link from the articles show' do
    it 'displays a form to edit an article' do
      article = Article.create!(title: 'New title', body: 'new body')

      visit article_path(article)

      click_link 'Edit'

      expect(current_path).to eq(edit_article_path(article))

      fill_in 'Body', with: 'different'

      click_on 'Update Article'

      expect(page).to have_content('different')
      expect(page).to_not have_content('new body')
    end
  end
end
