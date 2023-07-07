FactoryBot.define do
  factory :notification do
    message { "MyString" }
    ticket { nil }
    account { nil }
  end
end
