include FactoryBot::Syntax::Methods

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Article.destroy_all
Comment.destroy_all
Tag.destroy_all
Tagging.destroy_all

5.times { create(:tag) }

10.times do
  user = FactoryBot.create(:user)
  5.times do
    article = FactoryBot.create(:article, user: user)

    # Create comments for each article
    rand(1..4).times do
      FactoryBot.create(:comment, article: article)
    end

    # Create tags and taggings for each article
    article.tags << Tag.all.sample(rand(1..3))
  end
end
