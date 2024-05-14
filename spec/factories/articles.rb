FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph(sentence_count: 50, supplemental: false, random_sentences_to_add: 4) }
    user
  end
end
