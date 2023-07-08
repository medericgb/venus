FactoryBot.define do
  factory :client, class: Accounts::Entities::Client do
    pwd = SecureRandom.base64(10)
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    type { "Accounts::Entities::Client" }
    password { pwd }
  end
end
