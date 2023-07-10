FactoryBot.define do
  factory :ticket, class: Tickets::Entities::Ticket do
    client factory: :client
    intervenant factory: :intervenant
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph }
    state { "open" }
  end
end
