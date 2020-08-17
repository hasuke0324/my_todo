FactoryBot.define do
  factory :task do
    content {Faker::Lorem.characters(number: 10)}
    user
  end
end