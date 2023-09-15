FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    price { 1.5 }
    subscription { nil }
  end
end
