FactoryBot.define do
  sequence(:id) { |n| "#{n}" }
  factory :product do
    id
    name "abcd"
    description "abcd"
    price 100
    colour "red"
  end
end
