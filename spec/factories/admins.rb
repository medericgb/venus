FactoryBot.define do
  factory :admin, class: Accounts::Entities::Admin do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { SecureRandom.base64(10) }
  end
end