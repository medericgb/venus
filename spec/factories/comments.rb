FactoryBot.define do
  factory :comment, class: Comments::Entities::Comment do
    ticket factory: :ticket
    account factory: :client
    content { Faker::Lorem.paragraph }
  end
end
