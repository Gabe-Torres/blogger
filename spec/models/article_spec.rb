require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it { should have_many(:comments) }
    it { should have_many(:taggings) }
    it { should have_many(:tags).through(:taggings) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'Instance Methods' do
  end
end
