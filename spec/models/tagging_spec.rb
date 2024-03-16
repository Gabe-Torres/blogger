require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'Associations' do
    it { should belong_to(:tag) }
    it { should belong_to(:article) }
  end

  describe 'Validations' do
    # it { should validate_presence_of :example }
  end

  describe 'Instance Methods' do
  end
end
