FactoryBot.define do
  factory :account, class: Accounts::Entities::Account do
    pwd = SecureRandom.base64(10)
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    role { %w(admin intervenant client).sample }
    password { pwd }
  end
end
