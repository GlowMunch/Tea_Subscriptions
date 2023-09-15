FactoryBot.define do
  factory :tea do
    title { Faker::Hipster.word }
    description { Faker::Hipster.sentence(word_count: 3) }
    temperature { Faker::Number.between(from: 100, to: 212) }
    brew_time { Faker::Number.between(from: 1, to: 5) }
  end
end