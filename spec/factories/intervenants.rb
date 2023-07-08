FactoryBot.define do
  factory :intervenant, class: Accounts::Entities::Intervenant do
    pwd = SecureRandom.base64(10)
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    type { "Accounts::Entities::Intervenant" }
    password { pwd }
  end
end