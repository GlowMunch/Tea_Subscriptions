FactoryBot.define do
  factory :subscription do
    cost { Faker::Number.decimal(l_digits: 2) }
    status { 1 }
  end
end
