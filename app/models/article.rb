class Article < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit:
    [100,100]
  end

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