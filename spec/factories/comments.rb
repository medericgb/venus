FactoryBot.define do
  factory :comment do
    ticket
    account
    content { Faker::Lorem.paragraph }
  end
end
