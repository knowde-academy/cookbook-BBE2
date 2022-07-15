FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    content { Faker::Food.description }
    video_link { Faker::Internet.url }
    level { Faker::Number.between(from: 1, to: 5)}
  end
end
