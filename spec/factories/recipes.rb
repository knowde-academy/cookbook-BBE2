FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    content { Faker::Food.description }
    cooking_time { Faker::Number.number(digits: 2) }
    video_link { Faker::Internet.url }
  end
end
