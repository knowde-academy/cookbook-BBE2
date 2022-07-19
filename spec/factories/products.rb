FactoryBot.define do
  factory :product do
    name { Faker::Food.ingredient }
    name { FactoryBot::Number.between(from: 1, to: 8) }
  end
end
