FactoryBot.define do
  factory :tag do
    sequence(:name, ["apple", "dell", "PlayStation", "cookies", "rocks"].shuffle.cycle)
  end
end