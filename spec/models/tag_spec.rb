require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Associations' do
    it { should have_many(:taggings) }
    it { should have_many(:articles).through(:taggings) }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end

  describe 'Instance Methods' do
    
  end
end