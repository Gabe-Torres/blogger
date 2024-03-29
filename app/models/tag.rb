class Tag < ApplicationRecord
  validates_presence_of :name

has_many :taggings, dependent: :destroy
has_many :articles, through: :taggings
end
