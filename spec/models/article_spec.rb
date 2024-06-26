require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:taggings) }
    it { should have_many(:tags).through(:taggings) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'Instance Methods' do
    describe '#tag_list' do
      it 'turns associated tags into a string' do
        user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
        article = user.articles.create(title: "Tall Tables", body: "They are tough for the short legged")
        article.tags.create(name: 'furniture')
        article.tags.create(name: 'opinions')

        expect(article.tag_list).to eq("furniture, opinions")
      end
    end
  end
end
