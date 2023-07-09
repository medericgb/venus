FactoryBot.define do
  factory :user, class: Accounts::Entities::User do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    type { [Accounts::Entities::Intervenant, Accounts::Entities::Client, Accounts::Entities::Admin].sample }
    password { SecureRandom.base64(10) }
  end
end