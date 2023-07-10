FactoryBot.define do
  factory :comment do
    ticket
    user
    content { Faker::Lorem.paragraph }
  end
end
