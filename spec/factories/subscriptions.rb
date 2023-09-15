FactoryBot.define do
  factory :subscription do
    association :customer
    title { Faker::Hipster.sentence(word_count: 3) }
    price { Faker::Number.decimal(l_digits: 2) }
    status { 0 }
    frequency { "Every week" }
  end
end
