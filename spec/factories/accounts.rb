FactoryBot.define do
  factory :account do
    username { "MyString" }
    email { "MyString" }
    role { "MyString" }
    password_digest { "MyString" }
    recovery_password_digest { "MyString" }
  end
end
