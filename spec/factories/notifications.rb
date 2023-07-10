FactoryBot.define do
  factory :notification do
    message { Faker::Lorem.paragraph }
    ticket factory: :ticket
    account factory: :user
  end
end
