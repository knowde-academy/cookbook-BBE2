FactoryBot.define do
  factory :product do
    name { Faker::Food.ingredient }
    quantity { Faker::Number.between(from: 1, to: 8) }
  end
end
