require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:article) }
  end

  describe 'Validations' do
  end

  describe 'Instance Methods' do
  end
end
