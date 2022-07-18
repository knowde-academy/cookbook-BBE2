FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    content { Faker::Food.description }
    price { Faker::Number.decimal }
    cooking_time { Faker::Number.number(digits: 2) }
    video_link { Faker::Internet.url }
    level { Faker::Number.between(from: 1, to: 5) }
  end
end
