FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true) } # You can use Faker here too if you want
  end
end