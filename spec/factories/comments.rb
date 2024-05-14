FactoryBot.define do
  factory :comment do
    author_name { Faker::JapaneseMedia::Naruto.character }
    body { Faker::JapaneseMedia::StudioGhibli.quote }
    article
  end
end