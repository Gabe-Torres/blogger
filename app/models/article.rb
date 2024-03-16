class Article < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings 
  has_many :comments, dependent: :destroy

  validates_presence_of :title,
                        :body

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(tags_string)
    tag_name = tags_string.split(", ").collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_name.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end