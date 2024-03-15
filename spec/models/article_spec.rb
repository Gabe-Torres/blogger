require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it {should have_many(:comments)}
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'Instance Methods' do
  end
end
